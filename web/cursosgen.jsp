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
        <li><a href="index.jsp">INICIO</a></li>
        <li><a href="articulos.jsp">OATs</a></li>
        <%
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            if(user==null&&acc==null){
                out.println("<li><a href=\"login.jsp\">LOGIN</a></li>");
            }else{
                out.println("<li><a href=\"indexnus.jsp\">"+user+"</a></li>");
            }
        %>
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
        <h1>Los cursos más nuevos en la plataforma</h1>
    </div>
    <div class="col-sm-4">
    </div>
      <div>
      </div>
  </div>
</div>          
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            
        try{           
            ResultSet rs=null;
            ResultSet rs2 = null;
            int iduser = 0;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            try{
                rs=manejador.executeQuery("select idUser from users where id='"+user+"';");
                rs.next();
                iduser=rs.getInt("users.idUser");
            }catch(Exception ex){
                System.out.println(ex);
            }
            rs2=manejador.executeQuery("select * from cursos, profesores where cursos.id_prof=profesores.id_usu;");
            out.println("<table class=\"table table-responsive\">");
            //out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Curso</th>");
            out.println("<th>Responsable</th>");
            out.println("<th>¿Sobre que es el curso?</th>");
            out.println("<th>Lugares disponibles</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                //out.println("<th>"+rs2.getString("cursos.id_curso")+"</th>");
                out.println("<th>"+rs2.getString("cursos.Nombre")+"</th>");
                out.println("<th>"+rs2.getString("profesores.nom_prof")+" "+rs2.getString("profesores.apps_prof")+"</th>");
                out.println("<th>"+rs2.getString("cursos.Descripcion")+"</th>");
                out.println("<th>"+rs2.getString("cursos.Lugares")+"</th>");
                //out.println("<th>"+rs2.getString("usuarios.acc_usu")+"</th>");
                out.println("<th>");
                if(user==null&&acc==null){
                    out.println("<a href=\"login.jsp\" class=\"btn btn-warning btn-sm\">Ingrese para inscribirse al curso</a>");
                }else{
                    out.println(" <a href='inscribirse.jsp?idc="+rs2.getString("cursos.id_curso")+"&idu="+iduser+"'class=\"btn btn-success btn-sm\">inscribirse</a>");
                }
                out.println("</th>");
                out.println("</tr>");
                
                //<button type="button" class="btn btn-primary btn-block">Button 1</button>
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
        }catch(Exception e){
            response.sendRedirect("index.jsp");
        }

        %>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>PAT</p>		
</footer>
</body>
</html>

