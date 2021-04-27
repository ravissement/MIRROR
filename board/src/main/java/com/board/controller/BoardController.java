package com.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.domain.ReplyVO;
//import com.board.service.BoardService;
import com.board.service.BoardService;
import com.board.service.ReplyService;
import com.board.utils.UploadFileUtils;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	private BoardService service;
	
	@Inject
	private ReplyService replyService;
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model, @RequestParam("user_id") String user_id, @RequestParam("num") int num, 
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.userSearchCount(searchType, keyword, user_id));  
		
		
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<BoardVO> list = null;
		list = service.userList(page.getDisplayPost(), page.getPostNum(), searchType, keyword, user_id);
		
		model.addAttribute("list", list);
		//model.addAttribute("nav", "noSearch");
	}
	
	
	//게시물 목록 무한 스크롤
	@ResponseBody
	@RequestMapping(value = "/listAjax", method = RequestMethod.POST)
	public Object getListAjax(Model model, @RequestParam("user_id") String user_id, @RequestParam("num") int num, 
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.userSearchCount(searchType, keyword, user_id));  
		
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<BoardVO> list = null;
		list = service.userList(page.getDisplayPost(), page.getPostNum(), searchType, keyword, user_id);
		
		//model.addAttribute("list", list);
		//DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		//String today = sdFormat.format(list.toString());
		
		return list; 
		//model.addAttribute("nav", "noSearch");
	}
	
	
	//게시물 작성
	@RequestMapping(value ="/write", method = RequestMethod.GET)
	public void getWrite(Model model) throws Exception {
		model.addAttribute("nav", "noSearch");
	}
	
	//저장
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public void postWrite(BoardVO vo,  Model model) throws Exception {
		
		
		BoardVO testVO = service.view(vo.getBno());
		if(testVO == null) {
			service.write(vo);
		}else {
			service.modify(vo);
		}
		
		model.addAttribute("writeMessage", "정상적으로 저장되었습니다.");
		
	}
	
	//Ajax 이미지 썸네일
	@ResponseBody
	@RequestMapping(value="/ajaxThumbnail", method= RequestMethod.POST)
	public Object ajaxThumb(@RequestParam(value = "boardThumbnail", required = false) MultipartFile boardThumbnail, BoardVO vo) throws Exception {
		System.out.println(boardThumbnail);
		String imgUploadPath = uploadPath + File.separator + "thumbnail";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		//String originalFilename = vo.getUser_id() + "_thumbnail.png";
		if(boardThumbnail != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, boardThumbnail.getOriginalFilename(), boardThumbnail.getBytes(), ymdPath); 
		} else {
			fileName = uploadPath + File.separator + "thumbnail" + File.separator + "none.png";
		}
		
		vo.setOri_boardThumbnail(File.separator + "boardThumbnail" + ymdPath + File.separator + fileName);
		vo.setBoardThumbnail(File.separator + "boardThumbnail" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		BoardVO testVO = service.view(vo.getBno());
		
		if(testVO == null) {
			service.writeThumb(vo);
			vo = service.view(vo.getBno());
			
		}else {
			service.modifyThumb(vo);
			vo = service.view(vo.getBno());
			
		}
		
		//ObjectMapper mapper = new ObjectMapper();
		//String jsonString = mapper.writeValueAsString(vo);
		//System.out.println(jsonString);
		return vo;
	}
	
	//Ajax 이미지 썸네일 
	@RequestMapping(value = "/ajaxThumbnailTest", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Object ajaxThumbTest(MultipartHttpServletRequest multipartRequest, BoardVO vo) throws Exception {
		
		
		List<HashMap> fileArrayList = new ArrayList<HashMap>();
	    HashMap fileHashMap;
	 
	 
	    File dir = new File(uploadPath); //파일 저장 경로 확인, 없으면 만든다.
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	 
	    Iterator<String> itr =  multipartRequest.getFileNames(); //파일들을 Iterator 에 넣는다.
	 
	    while (itr.hasNext()) { //파일을 하나씩 불러온다.
	        MultipartFile mpf = multipartRequest.getFile(itr.next());
	        String originalFilename = mpf.getOriginalFilename(); //파일명
	        String fileFullPath = uploadPath+ File.separator + "boardThumbnail"+ File.separator + originalFilename; //파일 전체 경로
	 
	        try {
	            mpf.transferTo(new File(fileFullPath)); //파일저장
	            
	    		vo.setBoardThumbnail(File.separator + "boardThumbnail"+ File.separator + originalFilename);
	    		vo.setOri_boardThumbnail(File.separator + "boardThumbnail"+ File.separator + originalFilename);
	 
	    		BoardVO testVO = service.view(vo.getBno());
	    		
	    		if(testVO == null) {
	    			service.writeThumb(vo);
	    			vo = service.view(vo.getBno());
	    			
	    		}else {
	    			service.modifyThumb(vo);
	    			vo = service.view(vo.getBno());
	    			
	    		}
	 
	        } catch (Exception e) {
	            System.out.println("postTempFile_ERROR======>"+fileFullPath);
	            e.printStackTrace();
	        }
	 
	    }
	    return vo;
	   
	}
	
	//게시물 조회
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO vo = service.view(bno);
		model.addAttribute("view", vo);
		model.addAttribute("nav", "noSearch");
		
		//댓글 조회
		List<ReplyVO> reply = null;
		reply = replyService.list(bno);
		model.addAttribute("reply", reply);
	}
	
	//게시물 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO vo = service.view(bno);
		model.addAttribute("nav", "noSearch");
		model.addAttribute("view", vo);
	}
	
	//게시물 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo, Model model) throws Exception {
		service.modify(vo);
		return "redirect:/board/view?bno="+ vo.getBno();
	}
	
	//게시물 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		
		service.delete(bno);
		return "redirect:/board/list";
	}
	
	//게시물 목록 + 페이징 처리
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
		
		
		Page page = new Page();
		
		
		page.setNum(num);
		page.setCount(service.count());  

		List<BoardVO> list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		model.addAttribute("pageNum", page.getPageNum());

		model.addAttribute("startPageNum", page.getStartPageNum());
		model.addAttribute("endPageNum", page.getEndPageNum());
		 
		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());  

		model.addAttribute("select", num);
		model.addAttribute("page", page);
		model.addAttribute("nav", "listPage");
	}
	
	//게시물 목록 + 페이징 처리 + 검색
	@RequestMapping(value="/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Page page = new Page();
		
		
		page.setNum(num);
		//page.setCount(service.count());  
		page.setCount(service.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		//page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		
		List<BoardVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("nav", "listPageSearch");
		
	}
}

























