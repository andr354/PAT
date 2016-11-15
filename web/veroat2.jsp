<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
    %>
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
                    <a class="navbar-brand" href="index.jsp"><img src="resources/logo.png" class="logo"/></a>
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
        <div id="about" class="container-fluid">
            <div class="row">

                <div >
                    <%@ page import="java.sql.*" %>
                    <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                    <%
                        String user = (String) session.getAttribute("userName");
                        String rol = "";
                        int nivel = 1;
                        ResultSet rs = null;
                        ResultSet rs2 = null;
                        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                        rs2 = manejador.executeQuery("SELECT * FROM oats, profesc WHERE id_oat='" + Id + "' ");
                        rs2.next();
                        out.println("<h1><center>" + rs2.getString("oats.titulo") + "</h1>");
                        out.println("<table class=\"table table-striped table-bordered table-responsive\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th>Autor</th>");
                        out.println("<th>Fecha de creación</th>");
                        out.println("</tr>");
                        out.println("</thead>");
                        out.println("<tbody>");
                        out.println("<tr>");
                        out.println("<th>" + rs2.getString("profesc.nom_prof") + " " + rs2.getString("profesc.apps_prof") + "</th>");
                        out.println("<th>" + rs2.getString("oats.fecha") + "</th>");
                        out.println("</tr>");
                        out.println("</tbody>");
                        out.println("</table>");

                        out.println("<table class=\"table table-striped table-bordered table-responsive\">");
                        out.println("<tr>");
                        out.println("<th>" + rs2.getString("oats.diagrama") + "</th>");
                        out.println("</tr>");
                        out.println("</table>");
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
