<%-- 
    Document   : vercurso
    Created on : 09-nov-2016, 21:41:43
    Author     :  Dillan 
--%>

<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
<%
    //Obtenemos el identificador del OAT.
    int Id = Integer.parseInt(request.getParameter("id"));
    //Establecemos la conección con la base de datos.
    manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
    //Donde se tendrán todos ls datos de los oats
    ResultSet rsOATs = null;
    //Donde se tendrán los datos del curso
    ResultSet rsCurso = null;
    try {
        rsOATs = manejador.executeQuery("SELECT * FROM oats, profesores WHERE oats.id_prof=profesores.id_usu AND oats.curso=" + Id + ";");
        rsCurso = manejador.executeQuery("SELECT * FROM cursos WHERE cursos.id_curso = " + Id + ";");
        System.out.println("Obteniendo los datos de la BD para Ver curso");
    }catch(Exception e){
        System.out.println(e);
        response.sendRedirect("errors.jsp?id=404");
    }
    //manejador.executeQuery("SELECT * FROM oats, profesores where oats.id_prof=profesores.id_usu and oats.curso=" + Id + ";");
%>
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
                    <a class="navbar-brand" href="index.jsp">Logo </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">INICIO</a></li>
                            <%
                                try {
                                    String user = (String) session.getAttribute("username");
                                    String acc = (String) session.getAttribute("acc");
                                    if (user == null && acc == null) {
                                        out.println("<li><a href=\"#login\">LOGIN</a></li>");
                                    } else {
                                        out.println("<li><a href=\"#login\">" + user + "</a></li>");
                                    }
                                } catch (Exception e) {
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
                    <h2>OATs recientes</h2><br>
                </div>
                <div class="col-sm-4">
                </div>
                <div>
                    <%
                        try {
                            ResultSet rs = null;
                            ResultSet rs2 = null;
                            //manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                            rs2 = manejador.executeQuery("SELECT * FROM oats, profesores where oats.id_prof=profesores.id_usu and oats.curso=" + Id + ";");
                            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th>Autor</th>");
                            out.println("<th>Titulo</th>");
                            out.println("<th>Descripción</th>");
                            out.println("<th>Fecha</th>");
                            out.println("<th>Acciones</th>");
                            out.println("</tr>");
                            out.println("</thead>");
                            out.println("<tbody>");

                            while (rs2.next()) {
                                out.println("<tr>");
                                out.println("<th>" + rs2.getString("profesores.nom_prof") + " " + rs2.getString("profesores.apps_prof") + "</th>");
                                out.println("<th>" + rs2.getString("oats.titulo") + "</th>");
                                out.println("<th>" + rs2.getString("oats.descrip") + "</th>");
                                out.println("<th>" + rs2.getString("oats.fecha") + "</th>");
                                out.println("<th>");
                                out.println(" <a href='veroat.jsp?id=" + rs2.getString("oats.id_oat") + "'>Ver</a>");
                                out.println("</th>");
                                out.println("</tr>");
                            }
                            out.println("</tbody>");
                            out.println("</table>");
                        } catch (Exception e) {
                            //response.sendRedirect("index.jsp");
                        }

                    %>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <%
                rsCurso.next();
                out.println("<div class='titulo'>"
                        + rsCurso.getString("cursos.Nombre")
                        + "</div>"
                        + "<div>"
                        + rsCurso.getString("cursos.Descripcion")
                        + "</div>");
                while(rsOATs.next()){
                    out.println("<hr><div class='row'>"+rsOATs.getString("oats.diagrama")+"</div>");
                }
            %>
        </div>
        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>         
            <p>PAT</p>		
        </footer>
    </body>
</html>