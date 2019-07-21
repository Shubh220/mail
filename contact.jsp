<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.mail.*,java.net.*"%>
<%@ page import="javax.activation.*" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Homes Template">
    <meta name="keywords" content="Homes, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home|Contact Page</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   if(request.getParameter("btnSend")!=null)
{
   try
  {
 		String name = request.getParameter("nm");
 		String mobile = request.getParameter("mb");
 		String email = request.getParameter("em");
 		String comment = request.getParameter("comm");
 		//String message = request.getParameter("message");
 		String host = "smtp.gmail.com";
        String to ="shubham221chaurasia@gmail.com";
        String from = "test.jsp2507@gmail.com"; // Set your email id 
        String pass="shivam2507"; //set your password
        String subject =  "Home.in";
        String messageText ="Name : " + name +"\nSubject : "+mobile+ "\nEmail : " + email + "\nMessage\n : " + comment;
        Properties props = System.getProperties();
        props.put("mail.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.port", "587");

        // If using authentication, otherwise comment out
        props.put("mail.smtp.auth", "true");

        // Gmail requires TLS, your server may not
        props.put("mail.smtp.starttls.enable", "true");

        Session mailSession = Session.getDefaultInstance(props, null);

        Message msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from));
        InternetAddress[] address = {new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(messageText);

        Transport transport = mailSession.getTransport("smtp");

        //connect with authentication
      		transport.connect(host,from ,pass);
        //connect without authentication
       // transport.connect();
        transport.sendMessage(msg, address);

        transport.close();

        //response.sendRedirect(request.getHeader("referer"));
  response.sendRedirect("thank.jsp");
   }
   
   catch(Exception e)
   {
   out.println(e.getMessage());
   }
   }
    %>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Header Section Begin -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Header Section End -->
    <!-- Hero Section Begin -->
    <section class="hero-section set-bg about-us" data-setbg="img/bg.jpg">
        <div class="container hero-text text-white">
            <h2>Contact</h2>
        </div>
    </section>
    <!-- Hero Section End -->
    <!-- Map Section Begin -->
    <div class="map-section">
        <div class="container-fluid">
            <div class="row">
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1785.6009111494243!2d80.34213816207811!3d26.481445897242764!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x399c3897fae7f009%3A0xddcb27c31a961e7b!2s14%2F76-K%2C+Permat%2C+Kanpur%2C+Uttar+Pradesh+208001!5e0!3m2!1sen!2sin!4v1559366542438!5m2!1sen!2sin" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- Map Section End -->
    <!-- Contact Section Begin -->
    <section class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="contact-form">
                        <h4>Get in Touch</h4>
                        <form>
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" class="name" placeholder="Name" name="nm" required>
                                </div>
                                <div class="col-lg-6">
                                    <input type="email" placeholder="Email" name="em" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <input type="text" placeholder="Subject" name="mb" required>
                                    <textarea placeholder="Message" name="comm" required></textarea>
                                    <button class="site-btn c-btn" name="btnSend">Send</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="contact-info">
                        <h4>Contact Details</h4>
                        <ul class="contact-addr">
                            <li><i class="flaticon-placeholder"></i><span>14/70 Civil Line, Kanpur, India</span>
                            </li>
                            <li><i class="flaticon-envelope"></i><span>happy-home@home.com</span></li>
                            <li><i class="flaticon-smartphone"></i><span>214-805-4428</span></li>
                        </ul>
                        <p>Monday a Friday: 9 am – 5 pm</p>
                        <p>Saturday: 9 am – 1pm</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
    <!-- Footer Section Begin -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/main.js"></script>
</body>

</html>