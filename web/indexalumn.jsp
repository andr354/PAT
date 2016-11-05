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
  <script src="//cdn.ckeditor.com/4.5.1/full-all/ckeditor.js"></script>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <script>
    function csesion(){
        var xhttp = new XMLHttpRequest();
        
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                alert("Adios ;)");
            }
        };
        
        xhttp.open("POST", "csesion.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id=0");
        setTimeout("location.href = 'index.jsp';", 1000);
    }
    </script> 
    
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
        <li><a href="indexprofesc.jsp">INICIO</a></li>
        <li><a href="mensajes.jsp">MENSAJES</a></li>
        <%
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            if(Integer.parseInt(acc)!=2){
                response.sendRedirect("index.jsp");
            }
            if(user==null&&acc==null){
                out.println("<li><a href=\"#login\">LOGIN</a></li>");
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
    </div>
    <div class="col-sm-4">
    </div>
      <div>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            String rol = "";
            int nivel = 1;
            int idU = 1;
            int idS = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            ResultSet rs3 = null;
            
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs=manejador.executeQuery("SELECT Users.rol, nivel, idUser, id_std FROM Users, students WHERE Users.id='"+user+"' and idUser=id_usu"); //"+user+"
            if(rs.next())
                rol = rs.getString("Users.rol");
                nivel = rs.getInt("Users.nivel");
                idU = rs.getInt("Users.idUser");
                idS = rs.getInt("students.id_std");;
            rs2=manejador.executeQuery("SELECT distinct oats.id_oat, oats.descrip, students.id_std FROM oats, students  WHERE  students.id_usu='"+idU+"' and oats.grupo=students.grp_std and estado=1"); //and id_dgp=id_dip
            //diagramas.descripcion es el comentario que hace el estudiante
            out.println("<h2>Diagramas asignados a tu grupo</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Descripción</th>");
            //out.println("<th>Mi comentario</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("oats.id_oat")+"</th>");
                out.println("<th>"+rs2.getString("oats.descrip")+"</th>");
                //out.println("<th>"+rs2.getString("diagramas.descripcion")+"</th>");
                out.println("<th>");
                out.println("<a href='veroat2.jsp?id="+rs2.getString("oats.id_oat")+"'>Ver OAT</a> |");
                out.println("<a href='comentar.jsp?id="+rs2.getString("oats.id_oat")+"&ide="+rs2.getInt("students.id_std")+"'>Comentar</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            
            
            rs3=manejador.executeQuery("SELECT distinct oats.id_oat, oats.descrip, students.id_std FROM oats, students, califs  WHERE estado=0 and students.id_usu='"+idU+"' and oats.grupo=students.grp_std");
            out.println("<h2>Tus calificaciones</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>OAT</th>");
            out.println("<th>Descripción</th>");
            //out.println("<th>Mi comentario</th>");
            out.println("<th>Calificación</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            int cuenta = 1;
            int total = 0;
            int res = 0;
            
            while(rs3.next()){
                out.println("<tr>");
                out.println("<th>"+rs3.getString("oats.id_oat")+"</th>");
                out.println("<th>"+rs3.getString("oats.descrip")+"</th>");
                ResultSet rs4 = null;
                rs4=manejador.executeQuery("SELECT SUM(calif), COUNT(calif)  FROM calfs, oats WHERE id_stdn="+idS+" AND id_dgp="+rs3.getString("oats.id_oat")+" AND estado=0");
                rs4.next();
                total=rs4.getInt("SUM(calif)");
                cuenta=rs4.getInt("COUNT(calif)");
                if(cuenta==0){
                    cuenta=1;
                }
                res = total/cuenta;
                //out.println("<th>"+rs2.getString("diagramas.descripcion")+"</th>");
                out.println("<th>"+res+"</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");

        %>
        </div>
  </div>
        <br><br>
        <button type="button" onclick="csesion()" class="btn btn-danger">Cerrar Sesión</button>
        <br><br>
        </div>   
<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>PAT</p>		
</footer>
</body>
</html>