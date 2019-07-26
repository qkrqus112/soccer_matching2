<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function() {
		$('.memberCheck_All').click(function() {
			if ($('.memberCheck_All').prop('checked')) {
				$('.memberChk').prop('checked', true);
			} else {
				$('.memberChk').prop('checked', false);
			}
		});
		$('.matchCheck_All').click(function() {
			if ($('.matchCheck_All').prop('checked')) {
				$('.matchChk').prop('checked', true);
			} else {
				$('.matchChk').prop('checked', false);
			}
		});
		$('.memberChk').click(function() {
			$('.memberCheck_All').prop('checked', false);
		});
		$('.matchChk').click(function() {
			$('.matchCheck_All').prop('checked', false);
		});

	});
</script>
<script>
	function checkSelectedValue() {
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr.push(list[i].value);
			}
		}

		var str = "";
		for ( var i in valueArr) {
			str += valueArr[i] + ", ";
		}
		$('#dibugConsole').html(str.slice(0, -2));
	}
</script>

<script>
	
</script>


</head>


<body>
	<div class="container">
		<h2>회원 관리</h2>
		<div class="panel panel-default">
			<div class="panel-heading">회원 명단</div>
			<div class="panel-body">
				<form method="GET" class="form-inline" action="/admin">
					<div class="form-inline">
						<select class="form-control" name="searchType" id="searchType">
							<option value="all">전체</option>
							<option value="name">이름</option>
							<option value="id">아이디</option>
							<option value="phone">전화번호</option>
							<option value="email">이메일</option>
						</select> <input class="form-control" type="text" id="keyword"
							name="keyword" value="" placeholder="검색어를 입력하세요" />
						<button class="btn btn-primary" name="btnSearch" id="btnSearch">검색</button>
					</div>
				</form>

				<form action="/api/members" method="post">
					<table class="table table-striped">
						<thead>
							<tr>
								<td><input type="checkbox" name="memberAll"
									class="memberCheck_All" /></td>
								<th>이름</th>
								<th>아이디</th>
								<th>전화번호</th>
								<th>이메일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${memberDTOList}">
								<tr>
									<td><input type="checkbox" class="memberChk"
										name="RowCheck" value="${m.number}" /></td>
									<td>${m.name}</td>
									<td>${m.id}</td>
									<td>${m.cphone}</td>
									<td>${m.email}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- <button type="button" onclick="checkSelectedValue();">삭제</button> -->
					<input type="submit" class="btn btn-dark" value="선택 삭제">
					<div id="dibugConsole"></div>
				</form>
			</div>
		</div>
	</div>

	<div class="container">
		<h2>매치 관리</h2>
		<div class="panel panel-default">
			<div class="panel-heading">등록 경기</div>
			<div class="panel-body">
				<form method="post" class="form-inline">

					<div class="form-group">
						<select class="form-control" name="skey" id="skey">
							<option value="all">전체</option>
							<option value="gameDate">날짜</option>
							<option value="startTime">경기시간</option>
							<option value="gameType">경기종류</option>
							<option value="gender">성별</option>
							<option value="placeName">경기장</option>
							<option value="address">위치</option>
							<option value="registerDate">등록일</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="svalue" name="svalue">
					</div>
					<button id="searchBtn" class="btn btn-primary">검색</button>

				</form>
				<table class="table table-striped">
					<thead>
						<tr>
							<td><input type="checkbox" name="matchAll"
								class="matchCheck_All" /></td>
							<th>날짜</th>
							<th>경기시간</th>
							<th>경기종류</th>
							<th>성별</th>
							<th>경기장</th>
							<th>위치</th>
							<th>등록일</th>

						</tr>
					</thead>

					<tbody>
						<c:forEach var="mb" items="${matchDTOList}">
							<tr>
								<td><input type="checkbox" class="matchChk" /></td>
								<td>${mb.date}</td>
								<td>${mb.startTime}:${mb.startTimeMinutes}~
									${mb.endTime}:${mb.endTimeMinutes}</td>
								<td>${mb.gameType}</td>
								<td>${mb.gender}</td>
								<td>${mb.address}</td>
								<td>${mb.placeName}</td>
								<td>${mb.registerDate}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="selectDelete_btn">삭제</button>
			</div>
		</div>
	</div>
</body>
</html>