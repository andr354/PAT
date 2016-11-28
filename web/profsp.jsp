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
        <script src="resources/busquedaTabla.js"></script>
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
                        <li><a href="admin.jsp">Inicio</a></li>
                        <li><a href="alumnos.jsp">Alumnos</a></li>
                        <li><a href="profs.jsp">Profesores</a></li>
                        <li><a href="profsp.jsp">Colaboradores</a></li>
                        <li><a href="oats.jsp">OA</a></li>
                        <li><a href="cursos.jsp">Cursos</a></li>
                        <li><a href="mensajes.jsp">Mensajes</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 

        </div>

        <!-- Container (About Section) -->
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
            <div id="about" class="container-fluid">
                <div class="row">
                    <div class="col-sm-8">
                        <h2>Administración de Profesores generadores de contenido</h2><br>
                    </div>
                    <div class="col-sm-4">
                        <span class="glyphicon glyphicon-signal logo"></span>
                    </div>
                    <div>
                        <h2>Agregar nuevo Colaborador</h2>
                    <s:form action="/AddProfesorG">
                        <div class="form-group">
                            <div class="col-xs-2">
                                <label for="idu">Usuario: </label>
                                <select name="idu" id="idu" class="form-control">
                                    <%
                                        try {
                                            String user = (String) session.getAttribute("username");
                                            String acc = (String) session.getAttribute("acc");
                                            int acc2 = Integer.parseInt(acc);
                                            //Nivel de acceso
                                            if (acc2 == 3) {
                                                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                                ResultSet users = manejador.executeQuery("SELECT * FROM users WHERE idUser!=1;");
                                                while (users.next()) {
                                                    if (!users.getString("users.id").equals("Admin")) {
                                                        out.println("<option value=\"" + users.getString("users.idUser") + "\">" /*+ users.getString("users.idUser") + " | " */ + users.getString("users.id") + "</option>");
                                                    }
                                                }
                                            }
                                        } catch (Exception e) {
                                            System.out.println(e);
                                            response.sendRedirect("index.jsp");
                                        }
                                    %>
                                </select>
                                <!--<input type="text" name="idu" id="idu" class="form-control"/>-->
                            </div>
                            <div class="col-xs-3">
                                <label for="nombre">Nombre(s): </label>
                                <input type="text" name="nombre" id="nombre" class="form-control"/>
                            </div>
                            <div class="col-xs-3">
                                <label for="apps">Apellido(s): </label>
                                <input type="text" name="apps" id="apps" class="form-control"/>
                            </div>
                            <div class="col-xs-3">
                                <label for="esp">Especialidad:(s): </label>
                                <input type="text" name="esp" id="esp" class="form-control"/>
                            </div>
                            <br>
                            <div class="col-xs-1">
                                <input type="submit" value="Agregar" class="btn btn-md btn-primary form-control" id="sub"/>
                            </div>
                        </div>
                    </s:form>
                </div><br><br>
                <div>
                    <div class="input-group"> <span class="input-group-addon">Busqueda</span>
                        <input id="filter" type="text" class="form-control" placeholder="Escribe aquí...">
                    </div> 
                    <table class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr>
                                <!--<th>Id Profesor</th>
                                <th>Id Usuario</th>-->
                                <th>Usuario</th>
                                <th>Nombre</th>
                                <th>Especialidad</th>
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
                                        ResultSet rs2 = null;
                                        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                        rs2 = manejador.executeQuery("SELECT users.id,  profesores.id_prof, profesores.nom_prof, profesores.esp_prof, profesores.apps_prof, profesores.id_usu FROM users, profesores WHERE users.idUser = profesores.id_usu;");

                                        while (rs2.next()) {
                                            out.println("<tr>");
                                            //out.println("<th>" + rs2.getString("profesores.id_prof") + "</th>");
                                            //out.println("<th>" + rs2.getString("profesores.id_usu") + "</th>");
                                            out.println("<th>" + rs2.getString("users.id") + "</th>");
                                            out.println("<th>" + rs2.getString("profesores.nom_prof") + " " + rs2.getString("profesores.apps_prof") + "</th>");
                                            out.println("<th>" + rs2.getString("profesores.esp_prof") + "</th>");
                                            out.println("<th>");
                                            out.println(" <a class=\"btn btn-sm btn-info\" href='modificarProf.jsp?id=" + rs2.getString("profesores.id_prof") + "'>Modificar</a> ");
                                            out.println(" <a class=\"btn btn-sm btn-info\" href='eliminarProf.jsp?id=" + rs2.getString("profesores.id_usu") + "'>Eliminar privilegios</a> ");
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

        </div>

        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>PAT</p>		
        </footer>
    </body>
</html>
