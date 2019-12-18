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
    <input type="email" name="email" id="email" placeholder="이메일을 입력하세요."><br>
    <span id="email-check" style="display:none;"></span>
    <input type="text" name="name" placeholder="닉네임을 입력하세요."><br>
    <input type="password" name="password" placeholder="비밀번호를 입력하세요."><br>
    <input type="text" name="tel" placeholder="전화번호를 입력하세요."><br>
    <input type="hidden" name="state" value='1'>
    <input type="hidden" name="grade" value='1'>
    <button type="submit">제출</button>
  </form>
  
  <script>
    let email = document.getElementById('email');
    let emailCheck = document.getElementById('email-check');
    email.addEventListener('blur', function(e) {
      let data = {
          "email" : e.target.value
        };
      fetch('checkEmail', {
        method : 'post',
        headers : {
          "Content-Type" : "application/json"
        },
        body : JSON.stringify(data)
      }).then(function(res) {
    	  return res.json()
      }).then(function(json){
    	  if(json.checked == 0){
    		  emailCheck.style.display="inline";
    		  emailCheck.style.color="green";
    		  emailCheck.innerText="사용 가능한 이메일입니다.\n"
    	  } else {
    		  emailCheck.style.display = "inline";
    		  emailCheck.style.color = "red";
    		  emailCheck.innerText = "중복된 이메일입니다.\n";
    	  }
   	  })
    })
  </script>
  
</body>
</html>