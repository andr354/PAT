<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <%@ page import="java.sql.*" %>
    <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
        String user = "";
        String acc = "";
        try {
            user = (String) session.getAttribute("username");
            acc = (String) session.getAttribute("acc");
        } catch (Exception e) {
            out.print(e);
            response.sendRedirect("index.jsp");
        }
        String rol = "";
        int nivel = 1;
        ResultSet rs = null;
        ResultSet rs2 = null;
        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
        rs2 = manejador.executeQuery("SELECT * FROM oats, profesores WHERE id_oat='" + Id + "' ");
        rs2.next();
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
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/angular.min.js"></script>
        <script type="text/javascript" src="resources/app.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css"/>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" ng-app="pat">

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
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="cursosgen.jsp">Cursos</a></li>
                        <li><a href="mensajes.jsp">Mensajes</a></li>
                            <%
                                if (user == null && acc == null) {
                                    out.println("<li><a href=\"login.jsp\">LOGIN</a></li>");
                                } else {
                                    out.println("<li><a href=\"indexnus.jsp\">" + user + "</a></li>");
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
                <div>
                    <div id="encabezado">
                        <!--<div id="titulo">-->
                        <h1 class="titulo">
                            <%  out.println("" + rs2.getString("oats.titulo")); %>
                        </h1>
                        <!--</div>-->
                        <h5>
                            <b>Por:</b> <b class="autor">
                                <% out.print("" + rs2.getString("profesores.nom_prof") + " " + rs2.getString("profesores.apps_prof")); %>
                            </b> <b class="time">
                                <%
                                    String date = rs2.getString("oats.fecha").split(" ")[0];
                                    String hour = rs2.getString("oats.fecha").split(" ")[1];
                                    out.print("" + date + "  " + hour.split(":")[0] + ":" + hour.split(":")[1]);%>
                            </b>
                        </h5>
                    </div>
                    <div class="well text-center">
                        <% out.println("<th>" + rs2.getString("oats.diagrama") + "</th>");%>
                    </div>
                </div>
            </div>

        </div>

        <footer class="container-fluid text-center">
            <a href="#about" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>PAT</p>		
        </footer>
    </body>
</html>
