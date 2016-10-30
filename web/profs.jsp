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
                    <h2>Administración de profesores escolares</h2><br>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-signal logo"></span>
                </div>
                <div>
                    <%@ page import="java.sql.*" %>
                    <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                        <h3>Agregar nuevo profesor escolar</h3>
                    <s:form action="/AddProfEsc" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-xs-2">
                                <label for="id_usuario">Usuario: </label> 
                                <select name="id_usuario" id="id_usuario" class="form-control">
                                    <%
                                        try {
                                            manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                            ResultSet users = manejador.executeQuery("SELECT idUser, id FROM users");
                                            while (users.next()) {
                                                out.println("<option value=\"" + users.getString("users.idUser") + "\">" + users.getString("users.idUser") + " | " + users.getString("users.id")+ "</option>");
                                            }
                                        } catch (Exception e) {
                                            out.print(e);
                                            response.sendRedirect("index.jsp");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col-xs-3">
                                <label for="nombre">Nombre (s): </label>
                                <input type="text" name="nombre" id="nombre" class="form-control"/>
                            </div>
                            <div class="col-xs-3">
                                <label for="apellidos">Apellido (s)</label>
                                <input type="text" name="apellidos" id="apellidos" class="form-control"/>
                            </div>
                            <div class="col-xs-3">
                                <label for="escuela">Escuela</label>
                                <input type="text" name="escuela" id="escuela" class="form-control"/>
                            </div>
                            <div class="col-xs-1">
                                <label for="accept">.</label><br>
                                <button type="submit" class="btn btn-default" id="accept">Aceptar</button>
                            </div>
                        </div>
                    </s:form><br><br>
                </div>
                <p>
                    <h3><br>Lista de profesores escolares: </h3>
                </p>
                <div class="input-group"> <span class="input-group-addon">Busqueda</span>
                       <input id="filter" type="text" class="form-control" placeholder="Escribe aquí...">
                </div>  
                <table class="table table-striped table-bordered table-responsive">
                    <thead>
                        <tr>
                            <th>Id Prof</th>
                            <th>id_usu</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Escuela</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="searchable">
                        <%
                            try {
                                String user = (String) session.getAttribute("username");
                                String acc = (String) session.getAttribute("acc");
                                int acc2 = Integer.parseInt(acc);
                                if (acc2 == 3) {
                                    //out.println("Acceso autorizado<br>");
                                    System.out.println("Probando Administracion de profesores escolares...");
                                    ResultSet rs2 = null;
                                    manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                    rs2 = manejador.executeQuery("SELECT id_profe, id_usu, nom_prof, apps_prof, escuela FROM profesc");

                                    while (rs2.next()) {
                                        out.println("<tr>");
                                        out.println("<th>" + rs2.getString("profesc.id_profe") + "</th>"
                                                + "<th>" + rs2.getString("profesc.id_usu") + "</th>"
                                                + "<th>" + rs2.getString("profesc.nom_prof") + "</th>"
                                                + "<th>" + rs2.getString("profesc.apps_prof") + "</th>"
                                                + "<th>" + rs2.getString("profesc.escuela") + "</th>"
                                        );

                                        out.println("<th>");
                                        out.println(" <a class=\"btn btn-sm btn-info\" href='modificarProfEsc.jsp?id=" + rs2.getString("profesc.id_profe") + "'>Modificar</a>");
                                        out.println(" <a class=\"btn btn-sm btn-info\" href='eliminarPE.jsp?id=" + rs2.getString("profesc.id_profe") + "'>Eliminar privilegios</a> ");
                                        out.println("</th>");
                                        out.println("</tr>");

                                    }
                                } else {
                                    response.sendRedirect("index.jsp");
                                }
                            } catch (Exception e) {
                                response.sendRedirect("index.jsp");
                            }

                        %>
                    </tbody>
                </table>
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
