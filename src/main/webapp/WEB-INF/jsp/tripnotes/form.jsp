<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행기</title>
</head>
<body>
	<div>
		<form action="add" method="post">
			<div>
				<input type="text" id="tripNotesTitle" name="tripNotesTitle" placeholder="제목을 입력해주세요">
				<input type="date" id="tripDay" name="tripDay">	
			</div>
			<textarea id="tripNotesContent" name="tripNotesContent" rows="10" cols="30" placeholder="내용을 입력해주세요"></textarea>
			<div>
				<input type="radio" name="publicStatus">공개
				<input type="radio" name="publicStatus">비공개
			</div>
		</form>
	</div>
</body>
</html>