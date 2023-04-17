<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토링 신청하기</title>
<style type="text/css">
</style>
</head>
<body>
<script type="text/javascript">
window.onload = function() {

	let avaStartDate = $("#avaStartDate").html();
	let avaEndDate = $("#avaEndDate").html();

	
	console.log(avaStartDate);
	console.log(avaEndDate);
	
	  var resDate = document.getElementById("resDate");
	  var resTime = document.getElementById("resTime");
	  if (resDate) {
	    resDate.addEventListener("change", function() {
	      console.log(resDate.value); // 콘솔로그로 선택한 날짜 출력
	      var selectedDate = new Date(resDate.value);
	      var minDate = new Date(avaStartDate);
	      var maxDate = new Date(avaEndDate);
	      if (selectedDate < minDate || selectedDate > maxDate) {
	        alert("선택한 날짜는 예약이 불가능합니다.");
	        resDate.value = "";
	      };
	    });
	  } else {
	    console.error("Cannot find element with id 'resDate'")
	  }
	
	  
	};
</script>
	<div class="card shadow md-4">
		<div class="card-header py-3">멘토링 날짜 정하기 폼</div>
		<div class="card-body">
<div id="avaStartDate" style="display: none;">
<fmt:formatDate value="${vo.avaStartDate }" pattern="yyyy-MM-dd"/>
</div>
<div id="avaEndDate" style="display: none;">
<fmt:formatDate value="${vo.avaEndDate }" pattern="yyyy-MM-dd"/>
</div>
			<form action="writeTime.do" method="get" id="writeTimeForm">
				
				
				<input type="hidden" name="mid" value="${vo.mid }">
				<input type="hidden" name="aid" value="${login.id }">
				<input type="hidden" name="mno" value="${vo.mno }">
				
					<h4>스케줄 설정 </h4>
					<div class="form-group">
    날짜 선택 <fmt:formatDate value="${vo.avaStartDate }" pattern="yyyy-MM-dd"/>~
				    <fmt:formatDate value="${vo.avaEndDate }" pattern="yyyy-MM-dd"/>:
				    <input type="date" id="resDate" name="resDate" required="required" 
				           min="${vo.avaStartDate}" max="${vo.avaEndDate}">
				    <c:forEach items="${resDateList}" var="reservedDate">
				        <c:if test="${reservedDate eq resDate}">
				            <label style="color: red;">이미 예약이 꽉 찬 날짜입니다.</label>
				        </c:if>
				    </c:forEach>
					</div>

				<button class="btn btn-success">지원하기</button>
				<button type="button" class="btn btn-success"
					onclick="history.back()">취소</button>
			</form>
		</div>
	</div>




</body>
</html>