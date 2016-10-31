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
  <!--<script src="ckeditor/ckeditor.js"></script>-->
  <script src="//cdn.ckeditor.com/4.5.1/full-all/ckeditor.js"></script>
  <style>
  body {
      font: 400 15px Lato, sans-serif;
      line-height: 1.8;
      color: #818181;
  }
  h2 {
      font-size: 24px;
      text-transform: uppercase;
      color: #303030;
      font-weight: 600;
      margin-bottom: 30px;
  }
  h4 {
      font-size: 19px;
      line-height: 1.375em;
      color: #303030;
      font-weight: 400;
      margin-bottom: 30px;
  }  
  .jumbotron {
      background-color: #6c132b;
      color: #fff;
      padding: 100px 25px;
      font-family: Montserrat, sans-serif;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #6c132b;
      font-size: 50px;
  }
  .logo {
      color: #6c132b;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #6c132b;
  }
  .carousel-indicators li {
      border-color: #6c132b;
  }
  .carousel-indicators li.active {
      background-color: #6c132b;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel {
      border: 1px solid #6c132b; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #6c132b;
      background-color: #fff !important;
      color: #6c132b;
  }
  .panel-heading {
      color: #fff !important;
      background-color: #6c132b !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #6c132b;
      color: #fff;
  }
  .navbar {
      margin-bottom: 0;
      background-color: #6c132b;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 4px;
      border-radius: 0;
      font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #6c132b !important;
      background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
  }
  footer .glyphicon {
      font-size: 20px;
      margin-bottom: 20px;
      color: #6c132b;
  }
  .slideanim {visibility:hidden;}
  .slide {
      animation-name: slide;
      -webkit-animation-name: slide;	
      animation-duration: 1s;	
      -webkit-animation-duration: 1s;
      visibility: visible;			
  }
  @keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }	
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }
  </style>
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
      <a class="navbar-brand" href="index.jsp">Logo </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admin.jsp">INICIO</a></li>
        <li><a href="alumnos.jsp">Alumnos</a></li>
        <li><a href="profs.jsp">Profesores</a></li>
        <li><a href="profsp.jsp">Profesores+</a></li>
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
      <h2>Administración de OATs</h2><br>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
      <div>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            
        try{
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            int acc2 = Integer.parseInt(acc);  
        if(acc2==3){
            ResultSet rs=null;
            ResultSet rs2 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");

            rs2=manejador.executeQuery("SELECT * FROM oats, profesores WHERE oats.id_prof=profesores.id_prof;");
            
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id oat</th>");
            out.println("<th>Creador</th>");
            out.println("<th>Titulo</th>");
            out.println("<th>Descripción</th>");
            out.println("<th>Fecha</th>");
            out.println("<th>Curso</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("oats.id_oat")+"</th>");
                out.println("<th>"+rs2.getString("profesores.nom_prof")+" "+rs2.getString("profesores.apps_prof")+"</th>");
                out.println("<th>"+rs2.getString("oats.titulo")+"</th>");
                out.println("<th>"+rs2.getString("oats.descrip")+"</th>");
                out.println("<th>"+rs2.getString("oats.fecha")+"</th>");
                out.println("<th>"+rs2.getString("oats.curso")+"</th>");
                out.println("<th>");
                out.println(" <a href='veroat.jsp?id="+rs2.getString("oats.id_oat")+"'>Ver</a> |");
                out.println(" <a href='modificarEst.jsp?id="+rs2.getString("oats.id_oat")+"'>Modificar</a> |");
                out.println(" <a href='eliminarEst.jsp?id="+rs2.getString("oats.id_oat")+"'>Eliminar privilegios</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
        }else{
            response.sendRedirect("index.jsp");
        }
        }catch(Exception e){
            response.sendRedirect("index.jsp");
        }

        %>
      </div>
  </div>
      <h2>Crear un OAT</h2>
        <s:form action="/AddOAT" id="usrform">
            ID de generador: <br><input type="number" name="id"/><br>
            Titulo: <br><input type ="text" name="titulo"/><br>
            Descripción: <br><input type="text" name = "desc"/><br>
            Curso al que pertenece el OAT: <br><input type="number" name = "curso"/><br>
            <br><textarea name="contenido" form="usrform" id="contenido" rows="20" cols="80"></textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'contenido' );
            </script>
            <br>
            <br>
            <s:submit/>
        </s:form>
</div>
<script>
        var f = new Date();
        document.write(f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear());
    </script>
<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>         
  <p>PAT</p>		
</footer>
</body>
</html>
