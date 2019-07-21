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
    <title>mail</title>
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
</body>

</html>
