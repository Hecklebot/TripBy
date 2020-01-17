<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>login form</title>
</head>
<body>
  <div id="login-div">
    <label>Email</label>
    <input type="email" placeholder="E-mail" id="email">
    <label>Password</label>
    <input type="password" placeholder="Password" id="password">
    <button id="login-btn">login</button>
  </div>
  <div id="find-info-div">
    <a href="findEmail">forgot my email</a>
    <a href="">forgot my password</a>
  </div>
  
  <div id="find-email-test-div">
    <label>Phone number</label><br>
    <input type="text" placeholder="Phone number" id="input-tel">
    <button id="find-email">find</button>
  </div>
  <script>
    // email 찾기
    let inputPhoneNum = document.getElementById('input-tel');
    let findBtn = document.getElementById('find-email');
   
    findBtn.addEventListener('click', (e) => {
      data = {
        "tel": inputPhoneNum.value
      }
      fetch('findEmail', {
        method: 'post',
        headers: {
          "Content-type":"application/json"
        },
        body: JSON.stringify(data)
      }).then((res) => {
        return res.json()
      }).then((json) => {
        alert("email: " + json.findValue);
      })
    })
    
    // login 하기
    let loginBtn = document.getElementById('login-btn');
    let email = document.getElementById('email');
    let password = document.getElementById('password');
    
    loginBtn.addEventListener('click', (e) => {
      data = {
         "email": email.value,
         "password": password.value
      }
      fetch('login', {
        method: 'POST',
        headers: {
          "Content-type": "application/json"
        },  
        body: JSON.stringify(data)
      }).then(res => {
        return res.json();
      }).then(json => {
    	  alert("welcome, " + json.name);
      })
    })
    
 </script>
</body>
</html>