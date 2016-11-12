<%-- 
    Document   : modificarOat
    Created on : 11/11/2016, 10:20:37 AM
    Author     : Dillan
--%>

<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
    <html lang="es">
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
        String user = (String) session.getAttribute("userName");
        String data = "";
        ResultSet oats = null;
        ResultSet cursos = null;
        try {
            manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
            oats = manejador.executeQuery("SELECT * FROM oats, cursos WHERE id_oat=" + Id + " ");
            cursos = manejador.executeQuery("SELECT * FROM cursos, profesores WHERE cursos.id_prof=profesores.id_usu;");
            oats.next();
        } catch (Exception e) {
            System.out.println(e+"\nModificarOats.jsp");
            response.sendRedirect("oats.jsp");
        }
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
        <!--<script src="ckeditor/ckeditor.js"></script>-->
        <script src="//cdn.ckeditor.com/4.5.1/full-all/ckeditor.js"></script>
        <script src="resources/busquedaTabla.js"></script>
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
        <div id="about">
            <div class="row text-center">
                <h2>Modificar Usuario Profesor Generador</h2><br>
            </div>
            <div class="row text-center">
                <h3 class="time">Datos actuales del usuario</h3>
                <div class="col-sm-8 col-sm-offset-2 text-center">
                    <%
                        try {
                            out.println("<input type=\"hidden\" value='" + oats.getString("oats.diagrama") + "' id=\"data\"/>");
                        } catch (Exception e) {
                        }
                    %>
                    <s:form action="/ModOAT"  id="usrform" class="form-group">

                        <input type="submit" value="Modificar" class="btn btn-md btn-warning col-md-4 col-md-offset-4"/><br><br>
                        <table class="table table-striped table-bordered table-responsive">
                            <thead>
                                <tr>
                                    <th>Titulo</th>
                                    <th>Descripción</th>
                                    <th>Curso</th>
                                </tr>
                            </thead>
                            <input type="hidden" name="id" value=<% out.println(Id);%>/>
                            <tbody>
                                <%
                                    try {
                                        out.println("<tr><th>");
                                        out.println("<input type=\"text\" name=\"titulo\" value=\"" + oats.getString("oats.titulo") + "\" class=\"form-control\"  \"/>"
                                                + "</th><th><input type=\"text\" name=\"descrip\" value=\"" + oats.getString("oats.descrip") + "\" class=\"form-control\"/></th>"
                                                + "<th><input type=\"text\" name=\"grupo\" value=" + oats.getString("oats.grupo") + " class=\"form-control\">");
                                        out.println("</th></tr>");
                                    } catch (Exception e) {
                                    }
                                %>
                            </tbody>
                        </table>

                        <div>
                            <textarea name="diagrama" form="usrform" id="diagrama" rows="60" cols="80"></textarea>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
    </body>
    <script>
        var data = document.getElementById('data');
        CKEDITOR.replace('diagrama');
        CKEDITOR.instances['diagrama'].setData(data.value);
    </script>
</html>