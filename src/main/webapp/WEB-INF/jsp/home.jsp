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
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Fonts -->
  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="css/animate.css" rel="stylesheet" />
  <!-- Squad theme CSS -->
  <link href="css/style.css" rel="stylesheet">
  <link href="color/default.css" rel="stylesheet">

 

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
          <li><a href="#contact">Contact</a></li>
          
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">User <b class="caret"></b></a>
            <ul class="dropdown-menu">     
            <li><a href="/login">Login</a></li>
              
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
      <h4>WE ARE GROUP OF GENTLEMEN MAKING AWESOME WEB WITH BOOTSTRAP</h4>
    </div>
    <div class="page-scroll">
      <a href="#service" class="btn btn-circle">
				<i class="fa fa-angle-double-down animated"></i>
			</a>
    </div>
  </section>
  <!-- /Section: intro -->


 <!-- Section: Events-->
  <section id="service" class="home-section text-center bg-gray">

    <div class="heading-about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="wow bounceInDown" data-wow-delay="0.4s">
              <div class="section-heading">
                <h2>Our Events</h2>
                <i class="fa fa-2x fa-angle-down"></i>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- main body --> 
    <div class="wrapper ">
		<main class="hoc container clear"> 
		<div class="sidebar one_quarter first">
			
			<h3 style="color: #DC143C"><i class="fa fa-cloud"></i> Notification !</h3>
			<nav class="sdb_holder">
				<ul>
					<c:forEach items="${lastnews }" var="news">

						<li><a style="font-size:250%;color: #000000" >*****</a><a style="font-size:250%;color:#DC143C" href="/category/${news.category.id }/news/${news.id }"
							title="${news.title }"> <span
								style="font-family: courier;font-size:150%; color: #8A2BE2">${fmt.format(news.datecreated) }</span><br />
								${news.title }
						 </a></li>
					</c:forEach>
				</ul>
			</nav>
			
			
		</div>
		
		<div >
			<br></br>
			<br></br>
			<h1 class="center" style="font-style: oblique">WELCOME TO Team Kill Cloud </h1>
			<div>
			<h3 >&nbsp; &nbsp;&nbsp; &nbsp;What is the future for the cloud?</h3>
			<img  src="images/cloud.jpg"style="width:1200px;height:600px;">
			<br></br>
				<p style="font-family: Times New Roman;font-size:140%; color:#000000 ">&nbsp; &nbsp;The future of the cloud, like its present, will not be defined 
				by a single use-case or advancement. Instead artificial intelligence,blockchain 
				and other developments will shape the technology, agreed a panel at Computing's 
				annual Cloud & Infrastructure Summit..</p>
				<p style="font-family: Times New Roman;font-size:140%; color:#000000 " >
					In a few years, cloud computing will be essential for the continuity of the Internet itself as a whole.
                       The need for physical space, high energy costs and especially the ideology that we can have a better economy and technological harnessing 
                       idle resources to work with, will – and already do – that cloud computing is a global reality.
                       A survey conducted found that only 10% of the people interviewed were using cloud computing solutions, 
                       while in July this year the same question was asked and the number surprising: 66% of
                        people interviewed already use cloud computing solutions. These numbers represent the
                         power of evolution and impact of cloud computing on individuals and corporations around the globe..</p>
                         
					<p style="font-family: Times New Roman;font-size:140%; color:#000000 ">The more we enter the digital world, the more we realize that speed is critical 
					for decision making, whether positive or negative. Everything in cloud computing is connected and 
					allows immediate interaction, changes are applied at the time sent and a better use of time is also felt..</p>&nbsp;
				
			</div>
		</div>
		
		<!-- / main body -->
		<div class="clear"></div>
		</main>
	</div>

  </section>
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
                <div class="avatar"><img src="img/team/Ha.jpg" alt="" class="img-responsive img-circle" /></div>
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
                <div class="avatar"><img src="img/team/Nhan.jpg" alt="" class="img-responsive img-circle" /></div>

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
                <div class="avatar"><img src="img/team/Kha.jpg" alt="" class="img-responsive img-circle" /></div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- /Section: about -->



  <!-- Section: contact -->
  <section id="contact" class="home-section text-center">
    <div class="heading-contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="wow bounceInDown" data-wow-delay="0.4s">
              <div class="section-heading">
                <h2>Get in touch</h2>
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
        <div class="col-lg-8">
          <div class="boxed-grey">

            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            <form id="contact-form" action="" method="post" role="form" class="contactForm">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">
                                Name</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                    <div class="validation"></div>
                  </div>
                  <div class="form-group">
                    <label for="email">
                                Email Address</label>
                    <div class="form-group">
                      <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="subject">
                                Subject</label>
                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                    <div class="validation"></div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">
                                Message</label>
                    <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                    <div class="validation"></div>
                  </div>
                </div>
                <div class="col-md-12">
                  <button type="submit" class="btn btn-skin pull-right" id="btnContactUs">
                            Send Message</button>
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="col-lg-4">
          <div class="widget-contact">
            <h5>Main Office</h5>

            <address>
				  <strong>Squas Design, Inc.</strong><br>
				  Tower 795 Folsom Ave, Beautiful Suite 600<br>
				  San Francisco, CA 94107<br>
				  <abbr title="Phone">P:</abbr> (123) 456-7890
				</address>

            <address>
				  <strong>Email</strong><br>
				  <a href="mailto:#">email.name@example.com</a>
				</address>
            <address>
				  <strong>We're on social networks</strong><br>
                       	<ul class="company-social">
                            <li class="social-facebook"><a href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li class="social-twitter"><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li class="social-dribble"><a href="#" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                            <li class="social-google"><a href="#" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
				</address>

          </div>
        </div>
      </div>

    </div>
  </section>
  <!-- /Section: contact -->

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
          <p>&copy;SquadFREE. All rights reserved.</p>
          <div class="credits">
            <!--
              All the links in the footer should remain intact. 
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Squadfree
            -->
            <a href="https://bootstrapmade.com/bootstrap-one-page-templates/">Bootstrap One Page Templates</a> by BootstrapMade
          </div>
        </div>
      </div>
    </div>
  </footer>

  <!-- Core JavaScript Files -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.min.js"></script>
  <script src="js/jquery.scrollTo.js"></script>
  <script src="js/wow.min.js"></script>
  <!-- Custom Theme JavaScript -->
  <script src="js/custom.js"></script>
  <script src="contactform/contactform.js"></script>

</body>

</html>
