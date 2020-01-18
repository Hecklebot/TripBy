<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Tripby - Sign up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/ionicons.min.css">
    <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/css/jquery.timepicker.css">
    <link rel="stylesheet" href="/css/flaticon.css">
    <link rel="stylesheet" href="/css/icomoon.css">
    <link rel="stylesheet" href="/css/style.css">

</head>
 <section class="ftco-section services-section img" style="background-image: url(image/bg_1.jpg);">
  <div class="hero-wrap" style="background-image: url('https://post-phinf.pstatic.net/MjAxOTExMDVfMTA3/MDAxNTcyOTQ2NTcyNDIw.vtq-hO1QgSyUGDtvaYImL1jsxPY9OGCiWPttUHGOdCEg.QMZENaxRXoGbySgZXYX14T3LZlV7LGK-al9oz24aTHkg.JPEG/6dxow23eff21tzf0t6z3.jpg?type=w1200');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
      <div class="row no-gutters slider-text justify-content-start align-items-center">
        <div class="col-lg-6 col-md-6 ftco-animate d-flex align-items-end">
          <div class="text">
            <h1 class="mb-4">Now <span>It's easy for you</span> <span>rent a car</span></h1>
            <p style="font-size: 18px;">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts</p>
          </div>
        </div>
        <div class="col-lg-2 col"></div>
        <div class="col-lg-4 col-md-6 mt-0 mt-md-5 d-flex">
          <form action="add" method="post" class="request-form ftco-animate fadeInUp ftco-animated">
            <h2>Make your trip - TripBy</h2>
            <div class="form-group">
              <label for="" class="label">E-mail</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
              <span id="email-check" style="display:none;"></span>
            </div>
            <div class="form-group">
              <label for="" class="label">name</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="닉네임을 입력하세요.">
            </div>
            <div class="form-group">
              <label for="" class="label">password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요." maxlength=15>
              <span id="password-check" style="display:none;"></span>
            </div>
            <div class="d-flex">
              <div class="form-group mr-2">
                <label for="" class="label">Phone number</label>
                <input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호를 입력하세요." maxlength=11>
              </div>
            </div>
            <input type="hidden" name="state" id="state" value="1">
            <input type="hidden" name="grade" id="grade" value="1">
            <button type="submit" id="sign-in-btn" class="btn btn-primary py-10 px-6">Sign up</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
  <script>
    const inputEmail = document.querySelector('#email');
    const inputPassword = document.querySelector('#password');
    const emailCheck = document.querySelector('#email-check');
    const passwordCheck = document.querySelector('#password-check');
    const signInButton = document.querySelector('#sign-in-btn');
    const passwordRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 비밀번호 정규식 특문, 문자, 숫자 8~15

    // 이메일 중복 검사
    inputEmail.addEventListener('blur', e => {
      if(!inputEmail.value.length) { // 입력한 이메일이 없으면
          emailCheck.style.display='none'; // 아래 메세지를 안보이게 하고
          return; // 이벤트 종료
        }
    	const data = {
    		email: inputEmail.value,
    	};
      const checkValue = axios.post('checkEmail', {
    	  email: inputEmail.value,
      });
      checkValue.then(res => {
    	  if(res.data) { // 넘어온 값이 0이 아니면
    		  emailCheck.style.display='block';
    		  emailCheck.style.color='red';
 	        emailCheck.style.fontSize='12px';
    		  emailCheck.innerText = '중복된 이메일입니다.';
    	  } else { // 넘어온 값이 0이면
          emailCheck.style.display='block';
          emailCheck.style.color='green';
          emailCheck.style.fontSize='12px';
          emailCheck.innerText = '가입 가능한 이메일입니다.';
    	  }
      });
    });
    
    // 비밀번호 검사
    inputPassword.addEventListener('blur', e => {
      console.debug(passwordRegex.test(inputPassword.value));
      if(!passwordRegex.test(inputPassword.value)) {
    	  passwordCheck.innerText='숫자, 영어, 특수문자 8 ~ 15자로 입력해주세요.';
    	  passwordCheck.style.display='block';
    	  passwordCheck.style.fontSize='12px';
    	  passwordCheck.style.color='red';
      } else {
        passwordCheck.innerText='안전한 비밀번호입니다.';
        passwordCheck.style.fontSize='12px';
        passwordCheck.style.display='block';
        passwordCheck.style.color='green';
      }
    });
    
  </script>
  <script src="/node_modules/axios/dist/axios.min.js"></script>
  <script src="/js/jquery.min.js"></script>
  <script src="/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/js/popper.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/jquery.easing.1.3.js"></script>
  <script src="/js/jquery.waypoints.min.js"></script>
  <script src="/js/jquery.stellar.min.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/jquery.magnific-popup.min.js"></script>
  <script src="/js/aos.js"></script>
  <script src="/js/jquery.animateNumber.min.js"></script>
  <script src="/js/bootstrap-datepicker.js"></script>
  <script src="/js/jquery.timepicker.min.js"></script>
  <script src="/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/js/google-map.js"></script>
  <script src="/js/main.js"></script>
</body>
</html>