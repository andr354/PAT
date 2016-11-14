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
        <li><a href="indexprofp.jsp">INICIO</a></li>
        <li><a href="cursosprofp.jsp">CURSOS</a></li>
        <li><a href="mensajes.jsp">MENSAJES</a></li>
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
      <h2>Administración de Cursos</h2><br>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
      <div>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
        int idus = 0;
        try{    
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            int acc2 = Integer.parseInt(acc);
        if(acc2==4){
                //out.println("Acceso autorizado<br>");
            
            String rol = "";
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs = manejador.executeQuery("select idUser from users where id='"+user+"'");
                rs.next();
                idus = rs.getInt("users.idUser");
            rs2=manejador.executeQuery("select * from cursos, profesores where cursos.id_prof=profesores.id_usu and profesores.id_usu="+idus+";");
            
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Nombre</th>");
            out.println("<th>Responsable</th>");
            out.println("<th>Descripción</th>");
            out.println("<th>Lugares disponibles</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("cursos.id_curso")+"</th>");
                out.println("<th>"+rs2.getString("cursos.Nombre")+"</th>");
                out.println("<th>"+rs2.getString("profesores.nom_prof")+" "+rs2.getString("profesores.apps_prof")+"</th>");
                out.println("<th>"+rs2.getString("cursos.Descripcion")+"</th>");
                out.println("<th>"+rs2.getString("cursos.Lugares")+"</th>");
                //out.println("<th>"+rs2.getString("usuarios.acc_usu")+"</th>");
                out.println("<th>");
                out.println(" <a href='modificar.jsp?id="+rs2.getString("cursos.id_curso")+"'>Ver curso</a>");
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
      <h2>Crear un nuevo curso</h2>
        <s:form action="/AddCurso" id="ncurso">
            <input type="hidden" name="idu" value=<%out.println(idus);%>/>
            Nombre del curso: <br><input type="text" name = "nombre"/><br>
            Descripción: <br><textarea name="desc" form="ncurso" id="texto" rows="5" cols="50"></textarea><br>
            <br>
            <br>
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

