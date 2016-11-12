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

        <!-- Container (About Section) -->
        <div id="about" class="container-fluid">
            <div class="row">
                <div class="col-sm-8">
                    <h2>Modificar Usuario Profesor Generador</h2><br>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-wrench logo"></span>
                </div>
                <div class="col-sm-8 col-sm-offset-2 text-center">
                    <s:form action="/ModProfGen" class="form-horizontal form-control">
                        <table class="table table-striped table-bordered table-responsive">
                            <thead>
                                <tr>
                                    <th>Nombre(s)</th>
                                    <th>Apellido(s)</th>
                                    <th>Especialidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%@ page import="java.sql.*" %>
                                <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                                <h4>Datos actuales del usuario</h4>
                            <%
                                String user = (String) session.getAttribute("userName");
                                String rol = "";
                                String nomp = "";
                                String appp = "";
                                String espp = "";
                                int nivel = 1;
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                rs2 = manejador.executeQuery("SELECT * FROM profesores WHERE id_prof='" + Id + "' ");
                                while (rs2.next()) {
                                    nomp = rs2.getString("profesores.nom_prof");
                                    appp = rs2.getString("profesores.apps_prof");
                                    espp = rs2.getString("profesores.esp_prof");
                                    //out.println("<tr>");
                                    //out.println("<th>" + nomp + " " + appp + "</th>");
                                    //out.println("<th>" + espp + "</th>");
                                    //out.println("</tr>");
                                    out.println("<tr>");
                                    out.println("<input type=\"hidden\" name=\"id\" value=\"" + Id + "\" class=\"form-control\"/>");
                                    out.println("<th><input type=\"text\" placeHolder=\"" + nomp + "\" name=\"noms\" value=\"" + nomp + "\" class=\"form-control\"/></th>");
                                    out.println("<th><input type=\"text\" placeHolder=\"" + appp + "\" name=\"apps\" value=\"" + appp + "\" class=\"form-control\"/></th>");
                                    out.println("<th><input type=\"text\" placeHolder=\"" + espp + "\" name=\"esp\" value=\"" + espp + "\" class=\"form-control\"/></th>");
                                    //out.println("<th>" + espp + "</th>");
                                    out.println("</tr>");
                                }
                            %>
                            </tbody>
                        </table>
                        <div class="col-sm-6">
                            <a href="profsp.jsp" class="btn btn-primary btn-xl form-control">Regresar</a>            
                        </div>
                        <div class="col-sm-6">
                            <input type="submit" class="btn-warning btn-xl  form-control" value="Modificar"/>      
                        </div>
                    </div>
                </s:form>
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


