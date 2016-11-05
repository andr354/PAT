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
        
        <%
            int Id = Integer.parseInt(request.getParameter("id"));
            int Idu = Integer.parseInt(request.getParameter("idu"));
            int Idp = Integer.parseInt(request.getParameter("idp"));
            //out.println(Idu+1 +" id " + Id+2);
        %>

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
                        <li><a href="indexprofesc.jsp">INICIO</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 

        </div>

        <!-- Container (About Section) -->
        <div id="focused" class="container-fluid" >
            <div class="row">
                <div>  
<%@ page import="java.sql.*" %>
<jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
<%
            String user = (String)session.getAttribute("username");
            String rol = "";
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            ResultSet rss = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs=manejador.executeQuery("SELECT Users.rol, nivel FROM Users WHERE Users.id='"+user+"'"); //"+user+"
            rs2=manejador.executeQuery("SELECT id_dig, id_dgp, descripcion, notaP, calif FROM califs, students, oats WHERE id_prof="+Idp+" and id_oat=id_dgp and Id_stdn='"+Id+"' and id_usu='"+Idu+"'");
            rss=manejador.executeQuery("SELECT app_std, nom_std FROM students WHERE id_std='"+Id+"'");
            if(rs.next())
                rol = rs.getString("Users.rol");
                nivel = rs.getInt("Users.nivel");
            //manejador.closeConnection();
            rss.next();
            out.println("<h2>Participaciones por estudiante: "+ rss.getString("students.app_std") +" "+ rss.getString("students.nom_std") +"</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>OAT</th>");
            out.println("<th>Comentario</th>");
            out.println("<th>Participación</th>");
            out.println("<th>Notas profesor</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("califs.id_dig")+"</th>");
                out.println("<th>"+rs2.getString("califs.id_dgp")+"</th>");
                out.println("<th>"+rs2.getString("califs.descripcion")+"</th>");
                out.println("<th>"+rs2.getString("califs.calif")+"</th>");
                out.println("<th>"+rs2.getString("califs.notaP")+"</th>");
                out.println("<th>");
                out.println("<a href='calificar.jsp?id="+rs2.getString("califs.id_dig")+"'>Calificar</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");

        %>
                </div>
            </div>
        </div>

        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>PAT</p>		
        </footer>
    </body>
</html>
