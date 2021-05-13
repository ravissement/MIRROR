<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<style>
	table
	{
	    border: none;
	    text-align:center;
	    width:100%;
	    height: 70%;
	    font-size: 1.4em;
	}
  .diaryQuestion { font-weight: bold; font-size: 1.1em;}
	.diaryQuestionEng { font-weight: bold; font-size: 0.8em; color:#969696		}
</style>

<head>
<meta charset="UTF-8">
<title>calendar</title>
</head>
<body onload="build();">

<%@ include file="../include/header.jsp" %>




<div class="container">
	<p style="text-align:center;">
		<a class="diaryQuestion">원하는 날짜를 클릭해보세요.</a> <br/>
		<span class="diaryQuestionEng">Please click date what you want.</span>
	</p>
	<table align="center" id="calendar">
        <tr>
            <td><font size=4em; color="#B3B6B3" style="font-weight:bold;"><a href="#" onclick="beforem()" id="before" ><</a></font></td>
            <td colspan="5" align="center"><a id="yearmonth"></a></td>
            <td><font size=4em; color="#B3B6B3" style="font-weight:bold;"><a href="#" onclick="nextm()" id="next">></a></font></td>
        </tr>
        <tr>
            <td align="center"> <font color="#FF9090">Sun</font></td>
            <td align="center"> <a>Mon</a> </td>
            <td align="center"> <a>Tue</a> </td>
            <td align="center"> <a>Wed</a> </td>
            <td align="center"> <a>Thur</a> </td>
            <td align="center"> <a>Fri</a> </td>
            <td align="center"><font color=#7ED5E4>Sat</font></td>
        </tr>
    </table>
</div>    

</body>

<script type="text/javascript">

var today = new Date(); 
var date = new Date();

function beforem() 
{ 
    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    build(); 
}

function nextm()  
{
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    build();
}

function build()
{
    var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); 
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); 
    var tbcal = document.getElementById("calendar"); 
    var yearmonth = document.getElementById("yearmonth"); 
    yearmonth.innerHTML = today.getFullYear() + " / "+ (today.getMonth() + 1); 
    
    /*
    if(today.getMonth()+1==12) 
    {
        before.innerHTML=(today.getMonth());
        next.innerHTML="1";
    }
    else if(today.getMonth()+1==1) 
    {
    before.innerHTML="12";
    next.innerHTML=(today.getMonth()+2);
    }
    else 
    {
        before.innerHTML=(today.getMonth());
        next.innerHTML=(today.getMonth()+2);
    }
    */
   
    while (tbcal.rows.length > 2) 
    {
        tbcal.deleteRow(tbcal.rows.length - 1);
    }
    var row = null;
    row = tbcal.insertRow();
    var cnt = 0;

    for (i = 0; i < nMonth.getDay(); i++) 
    {
        cell = row.insertCell();
        cnt = cnt + 1;
    }
    
    for (i = 1; i <= lastDate.getDate(); i++) 
    { 
        cell = row.insertCell();
        cell.innerHTML = "<a href='#' onclick='diaryListSort("+today.getFullYear()+", "+(today.getMonth() + 1)+", "+i+")'>"+i+"</a>";
        cnt = cnt + 1;
        if (cnt % 7 == 1) {
            cell.innerHTML = "<font color=#FF9090><a href='#' onclick='diaryListSort("+today.getFullYear()+", "+(today.getMonth() + 1)+", "+i+")'>" + i
        }
        if (cnt % 7 == 0) { 
            cell.innerHTML = "<font color=#7ED5E4><a href='#' onclick='diaryListSort("+today.getFullYear()+", "+(today.getMonth() + 1)+", "+i+")'>" + i
            row = calendar.insertRow();
        }
        if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
        {
            cell.bgColor = "#DCEBFF"; 
        }
    }

}	
	


function diaryListSort(year, month, day) {
	//alert(year +" / "+ month + " / " + day);
	  var form = document.createElement("form");
      form.setAttribute("charset", "UTF-8");
      form.setAttribute("method", "Post"); 
      form.setAttribute("action", "/diary/diaryList"); 
			
      /*
      var hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", "diaryYear");
      hiddenField.setAttribute("value", year);
      form.appendChild(hiddenField);
			*/
			
			var hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", "diaryMonth");
      hiddenField.setAttribute("value", month);
      form.appendChild(hiddenField);

      hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", "diaryDay");
      hiddenField.setAttribute("value", day);
      form.appendChild(hiddenField);

      hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", "user_id");
      hiddenField.setAttribute("value", "${member.user_id}");
      form.appendChild(hiddenField);

      
      document.body.appendChild(form);

      form.submit();
}

</script>


</html>