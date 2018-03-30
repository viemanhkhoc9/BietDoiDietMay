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

	
		<div style="margin-top:10px" class="container">
		<h2 style="font-family: courier; color: orange">Home &raquo;
			${titleCategory }</h2>
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<div class="content three_quarter">
			<!-- ################################################################################################ -->
			<h1 class="center">${title }</h1>
			<div style="text-align: justify">${content }</div>
			<div >
				<c:if test="${not empty attachments }">
					<h3>Attachment File:</h3>
					<ul>
						<c:forEach items="${attachments }" var="attachment">
							<li><a target="_blank"
								href="https://drive.google.com/open?id=${attachment.key }">${attachment.value }</a>
								<iframe
									src="https://drive.google.com/file/d/${attachment.key }/preview"
									width="640" height="480"> </iframe></li>
						</c:forEach>

					</ul>
				</c:if>
				<p style="float: left; margin-top: 60px">
					<span class="glyphicon glyphicon-time" style="color: orange"></span>
					<time> ${datecreated }</time>
				</p>
				<p style="float: right; margin-top: 60px">
					<i>By Admin: <span
						style="text-transform: uppercase; color: orange">${us.username }</span></i>
				</p>
			</div>
			
			<c:if test="${not empty user }">
				<button style="margin-top:15px " title="Delete Post" class="btn-success btn-lg" id="btn-delete">
					<span style="" class="glyphicon glyphicon-trash"></span>
				</button>
				<button title="Edit Post" class="btn-success btn-lg" style="margin-left: 12px"
					id="btn-edit">
					<span  class="glyphicon glyphicon-cog"></span>
				</button>
			</c:if>
			
		</div>
		<!-- / main body -->	
		</div>	
						
					
  <!-- /Section: services -->
  <!-- Section: about -->
  <section id="about" class="home-section text-center">
    <div class="heading-about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="wow bounceInDown" data-wow-delay="0.4s">
              <div class="section-heading">
                <h2>About us</h2>
                <i class="fa fa-2x fa-angle-down"></i>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container">

      <div class="row">
        <div class="col-lg-2 col-lg-offset-5">
          <hr class="marginbot-50">
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
          <div class="wow bounceInUp" data-wow-delay="0.2s">
            <div class="team boxed-grey">
              <div class="inner">
                <h5>Mr.BestM416 </h5>
                <p class="subtitle">Caption Team</p>
                <div class="avatar"><img src="/img/team/Ha.jpg" alt="" class="img-responsive img-circle" /></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="wow bounceInUp" data-wow-delay="0.5s">
            <div class="team boxed-grey">
              <div class="inner">
                <h5>Nhan Le</h5>
                <p class="subtitle">Network programming</p>
                <div class="avatar"><img src="/img/team/Nhan.jpg" alt="" class="img-responsive img-circle" /></div>

              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="wow bounceInUp" data-wow-delay="0.8s">
            <div class="team boxed-grey">
              <div class="inner">
                <h5>Kha Le</h5>
                <p class="subtitle">programming system</p>
                <div class="avatar"><img src="/img/team/Kha.jpg" alt="" class="img-responsive img-circle" /></div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- /Section: about -->


  <footer>
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
	<script type="text/javascript">
if(${not empty deleteMessage})
	alert("${deleteMessage}");
var url = $(location).attr('href');
var id = ${id};
$("#btn-delete").on("click",function(){	
	var redirectURL = "/delete/category/" + id;
	if(url.indexOf("news") !== -1)
		redirectURL = "/delete/news/" + id;
    if(confirm("Are you sure you want to delete this?")){
    	window.location.replace(redirectURL);
    }
    else{
        return false;
    }
 });
$("#btn-edit").on("click",function(){	
	var redirectURL = "/edit/category/" + id;
	if(url.indexOf("news") !== -1)
		redirectURL = "/edit/news/" + id;
    window.location.replace(redirectURL);
 });
$(document).ready(function(){
	var arr = url.split('/');
	var id = arr[4];
	$("#"+id).addClass("active");
	$('[data-toggle="tooltip"]').tooltip(); 
});

</script>
</body>

</html>