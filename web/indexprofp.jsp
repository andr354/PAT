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
                    <h2>Administración de OATs</h2><br>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-signal logo"></span>
                </div>
                <div>
                    <%@ page import="java.sql.*" %>
                    <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                    <%
                        int idus = 0;
                        try {
                            String user = (String) session.getAttribute("username");
                            String acc = (String) session.getAttribute("acc");
                            int acc2 = Integer.parseInt(acc);
                            if (acc2 == 4) {
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                rs = manejador.executeQuery("select idUser from users where id='" + user + "'");
                                rs.next();
                                idus = rs.getInt("users.idUser");
                                rs2 = manejador.executeQuery("SELECT * FROM oats, profesores where oats.id_prof=profesores.id_usu and profesores.id_usu=" + idus + ";");

                                out.println("<h2>OATs creados por ti</h2>");
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

                                while (rs2.next()) {
                                    out.println("<tr>");
                                    out.println("<th>" + rs2.getString("oats.id_oat") + "</th>");
                                    out.println("<th>" + rs2.getString("profesores.nom_prof") + " " + rs2.getString("profesores.apps_prof") + "</th>");
                                    out.println("<th>" + rs2.getString("oats.titulo") + "</th>");
                                    out.println("<th>" + rs2.getString("oats.descrip") + "</th>");
                                    out.println("<th>" + rs2.getString("oats.fecha") + "</th>");
                                    out.println("<th>" + rs2.getString("oats.curso") + "</th>");
                                    out.println("<th>");
                                    out.println(" <a href='veroat.jsp?id=" + rs2.getString("oats.id_oat") + "'>Ver</a> |");
                                    out.println(" <a href='modificarOat.jsp?id=" + rs2.getString("oats.id_oat") + "'>Modificar</a> |");
                                    out.println(" <a href='eliminarOAt.jsp?id=" + rs2.getString("oats.id_oat") + "'>Eliminar</a>");
                                    out.println("</th>");
                                    out.println("</tr>");

                                }

                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                response.sendRedirect("index.jsp");
                            }
                        } catch (Exception e) {
                            response.sendRedirect("index.jsp");
                        }

                    %>
                </div>
            </div>
            <h2>Crear un OAT</h2>
            <s:form action="/AddOAT" id="usrform">
                <input type="hidden" name="id" value=<%out.println(idus);%>/>
                Titulo: <br><input type ="text" name="titulo"/><br>
                Descripción: <br><input type="text" name = "desc"/><br>
                Curso al que pertenece el OAT: <br><input type="number" name = "curso"/><br>
                <br><textarea name="contenido" form="usrform" id="contenido" rows="20" cols="80"></textarea>
                <script>
                    // Replace the <textarea id="editor1"> with a CKEditor
                    // instance, using default configuration.
                    CKEDITOR.replace('contenido');
                </script>
                <br>
                <br>
                <s:submit/>
            </s:form>
        </div>
        <script>
            var f = new Date();
            document.write(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
        </script>
        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>         
            <p>PAT</p>		
        </footer>
    </body>
</html>

