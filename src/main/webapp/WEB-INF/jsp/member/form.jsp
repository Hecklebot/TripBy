<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member form</title>
</head>
<body>
  <form action="add" method="post">
    <input type="email" name="email" placeholder="이메일을 입력하세요."><br>
    <input type="text" name="name" placeholder="닉네임을 입력하세요."><br>
    <input type="password" name="password" placeholder="비밀번호를 입력하세요."><br>
    <input type="text" name="tel" placeholder="전화번호를 입력하세요."><br>
    <input type="hidden" name="state" value='1'>
    <input type="hidden" name="grade" value='1'>
    <button type="submit">제출</button>
  </form>
</body>
</html>