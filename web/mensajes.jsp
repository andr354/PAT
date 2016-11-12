<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>PAT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
       

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="mensajes.jsp">PAT</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1>PAT</h1> 
  <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 

</div>

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
    </div>
    <div class="col-sm-4">
    </div>
      <div>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <h2>Mensajes enviados</h2>
        <%
         int id2 = 0;   
        try{
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            if(acc.equals(null)){
                response.sendRedirect("index.jsp");
            }
            int acc2 = Integer.parseInt(acc);  
            int id = 0;
            
            ResultSet rs=null;
            ResultSet rs2 = null;
            ResultSet rs3=null;
            ResultSet rs4=null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs2=manejador.executeQuery("SELECT * FROM mensajes, users where idUsuEnvia=users.idUser and users.id='"+user+"'");
            rs3=manejador.executeQuery("SELECT * FROM mensajes, users where idUsuRecibe=users.idUser and users.id='"+user+"'");
            rs4=manejador.executeQuery("SELECT idUser FROM users where users.id='"+user+"'");
            rs4.next();
            id2 = rs4.getInt("users.idUser");
            //out.println(id2);

            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Destinatario</th>");
            out.println("<th>Titulo</th>");
            out.println("<th>Mensaje</th>");
            out.println("<th>Fecha</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                id = rs2.getInt("mensajes.IdUsuRecibe");
                System.out.println(id);
                rs=manejador.executeQuery("select id from users where idUser="+id);
                rs.next();
                out.println("<tr>");
                out.println("<th>"+rs.getString("users.id")+"</th>");System.out.println("Hola");
                out.println("<th>"+rs2.getString("mensajes.Titulo")+"</th>");
                out.println("<th>"+rs2.getString("mensajes.Texto")+"</th>");
                out.println("<th>"+rs2.getString("mensajes.fecha")+"</th>");;
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            
            out.println("<br><h2>Mensajes recibidos</h2><br>");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Mensaje de</th>");
            out.println("<th>Titulo</th>");
            out.println("<th>Mensaje</th>");
            out.println("<th>Fecha</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs3.next()){
                id = rs3.getInt("mensajes.IdUsuEnvia");
                System.out.println(id);
                rs=manejador.executeQuery("select id from users where idUser="+id);
                rs.next();
                out.println("<tr>");
                out.println("<th>"+rs.getString("users.id")+"</th>");System.out.println("Hola");
                out.println("<th>"+rs3.getString("mensajes.Titulo")+"</th>");
                out.println("<th>"+rs3.getString("mensajes.Texto")+"</th>");
                out.println("<th>"+rs3.getString("mensajes.fecha")+"</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
        
        }catch(Exception e){
            response.sendRedirect("index.jsp");
        }

        %>
      </div>
  </div>
      <!--Dillan, aqui necesito tu magia -->
      <h2>Enviar mensaje</h2> 
        <s:form action="/EnviarM" id="mensajes">
            ID de usuario: <br><input type ="number" id="usr" name="usuario"/><br>
            Titulo: <br><input type="text" name="titulo"/><br>
            Texto: <br><textarea name="texto" form="mensajes" id="texto" rows="5" cols="50"></textarea><br>
            <input type="hidden" name="idenvia" value=<%out.println(id2);%>/>
            <s:submit/>
        </s:form>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>PAT</p>		
</footer>
</body>
</html>
