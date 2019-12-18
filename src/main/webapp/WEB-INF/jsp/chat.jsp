<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting Module</title>
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
<body>

  <div class="container">
    <div class="row">
      <div class="col">
        <div class="form-group">
          <label for="chatting-output">Output</label>
          <textarea id="chatting-output" cols="30" rows="10" class="form-control"
          style="margin-top: 0px; margin-bottom: 0px; height: 312px; resize: none;" readonly></textarea>
        </div>
        <div class="form-group">
          <textarea id="chatting-input" cols="30" rows="4" class="form-control"
          style="margin-top: 0px; margin-bottom: 0px; height: 312px; resize: none;"></textarea>
        </div>
        <div class="form-group">
          <input type="button" value="Submit" id="sendBtn" class="btn py-3 px-4 btn-primary">
        </div>
      </div>
    </div>
  </div>

  <script src="/node_modules/sockjs-client/dist/sockjs.min.js"></script>
  <script src="/js/chatting/socket_event.js"></script>
  <script src="/js/chatting/socket.js"></script>
</body>
</html>