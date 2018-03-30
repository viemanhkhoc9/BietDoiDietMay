<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Team Kill Cloud</title>

  <!-- Bootstrap Core CSS -->
  <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Fonts -->
  <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="/css/animate.css" rel="stylesheet" />
  <!-- Squad theme CSS -->
  <link href="/css/style.css" rel="stylesheet">
  <link href="/color/default.css" rel="stylesheet">

 

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
  <!-- Preloader -->
  <div id="preloader">
    <div id="load"></div>
  </div>

  <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header page-scroll">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
        <a class="navbar-brand" href="index.html">
          <h1>SQUAD CLOUD</h1>
        </a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#intro">Home</a></li>
          <li><a href="#service">Events</a></li>
          <li><a href="#about">About</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">User <b class="caret"></b></a>
            <ul class="dropdown-menu">
              
              <c:choose>
						<c:when test="${empty user }">
							<li><a href="/login">Login</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" data-toggle="tooltip"
								data-placement="bottom" title="${user.email }">${user.username }</a></li>
							<li><a href="/logout">Logout</a></li>
						</c:otherwise>
					</c:choose>
            </ul>
          </li>
			
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
  </nav>

  <!-- Section: intro -->
  <section id="intro" class="intro">

    <div class="slogan">
      <h2>WELCOME TO <span class="text_color">SQUAD</span> </h2>
      <h4>IF YOU NEVER TRY, YOU WILL NEVER KNOW</h4>
    </div>
    <div class="page-scroll">
      <a href="#service" class="btn btn-circle">
				<i class="fa fa-angle-double-down animated"></i>
			</a>
    </div>
  </section>
  <!-- /Section: intro -->

<div  class="container">

		<div class="content three_quarter">
			<h1>${title }</h1>
			<h1>Insert Attachment And Upload To GG Drive</h1>
			<div>
				<form method="POST" enctype="multipart/form-data"
					action="/upload-file">
					<input type="hidden" name="id" value="${id }" /> <input
						type="hidden" name="isCategory" value="${isCategory }" /> <input
						type="text" name="name" class="form-control"
						placeholder="Enter Name Of Attachment Here"><br /> <input
						type="file" name="file" class="form-control" /><br /> <input
						type="submit" value="Finish" class="btn" />
				</form>
			</div>
			<c:if test="${not empty attachments }">
				<br />
				<h3>List Attachments:</h3>
				<ul>
					<c:forEach items="${attachments}" var="attachment">
						<li><a
							href="https://drive.google.com/open?id=${attachment.key }">${attachment.value }</a></li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
</div>
						
					
  <!-- /Section: services -->
  
  <footer style="margin-top:10px">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-12">
          <div class="wow shake" data-wow-delay="0.4s">
            <div class="page-scroll marginbot-30">
              <a href="#intro" id="totop" class="btn btn-circle">
							<i class="fa fa-angle-double-up animated"></i>
						</a>
            </div>
          </div>
          <div class="credits">
            
            <a href="https://www.facebook.com/HoangHa.081297">Wecomle to Squad Cloud</a> 
          </div>
        </div>
      </div>
    </div>
  </footer>

  <!-- Core JavaScript Files -->
  <script src="/js/jquery.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/jquery.easing.min.js"></script>
  <script src="/js/jquery.scrollTo.js"></script>
  <script src="/js/wow.min.js"></script>
  <!-- Custom Theme JavaScript -->
  <script src="/js/custom.js"></script>
  <script src="/contactform/contactform.js"></script>
  <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script>
		$(document).ready(function() {
			CKEDITOR.replace('editor1');
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
</body>

</html>