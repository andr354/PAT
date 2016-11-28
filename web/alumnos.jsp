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
    <%@ page import="java.sql.*" %>
    <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
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
        <div id="about" class="container-fluid">
            <div class="row">
                <div class="col-sm-8">
                    <h2>Administración de Alumnos</h2><br>
                </div>
                </div>
                <h2>Agregar nuevo alumno</h2>
                <div class="form-group">
                    <s:form action="/AddAlumno" class="form-group">
                        <div class="col-xs-2">
                            <label for="idu">Alumno: </label> 
                            <select name="idu" id="idu" class="form-control" type ="number">
                                <%
                                    try {
                                        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                        ResultSet profesores = null; //manejador.executeQuery("SELECT idUser, id FROM users");
                                        ResultSet users = null;
                                        profesores = manejador.executeQuery("SELECT id_profe, id_usu, nom_prof FROM profesc");
                                        users = manejador.executeQuery("SELECT idUser, id FROM users");
                                        while (users.next()) {
                                            if (!users.getString("users.id").equals("Admin")) {
                                                out.println("<option value=" + users.getString("users.idUser") + ">" + users.getString("users.id") + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        System.err.print(e);
                                        response.sendRedirect("index.jsp");
                                    }
                                %>
                            </select>
                        </div>

                        <div class="col-xs-2">
                            <label for="nombre">Nombre(s): </label>
                            <input type="text" name="nombre" id="nombre" class="form-control"/>
                        </div>
                        <div class="col-xs-3">
                            <label for="apellidos">Apellido(s)</label>
                            <input type="text" name="apps" id="apellidos" class="form-control"/>
                        </div>
                        <div class="col-xs-2">
                            <label for="idProfesor">Profesor: </label> 
                            <select name="idp" id="idProfesor" class="form-control" type ="number">
                                <%
                                    try {
                                        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                        ResultSet profes = null; //manejador.executeQuery("SELECT idUser, id FROM users");
                                        ResultSet usuarios = null;
                                        profes = manejador.executeQuery("SELECT id_profe, id_usu, nom_prof FROM profesc");
                                        usuarios = manejador.executeQuery("SELECT idUser, id FROM users");
                                        //profes.next();
                                        while (profes.next()) {
                                            if (!profes.getString("profesc.id_usu").equals("1")) {
                                                out.println("<option value=" + profes.getString("profesc.id_profe") + ">" + profes.getString("profesc.nom_prof") + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        System.err.print(e);
                                        response.sendRedirect("index.jsp");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-xs-2">
                            <label for="submit">.</label><br>
                            <input type="submit" class="btn btn-primary btn-block" id="submit" value="Registrar">
                        </div>
                    </s:form>
                </div>
            </div><br><br>
            <div>
                <div class="input-group"> <span class="input-group-addon">Busqueda</span>
                    <input id="filter" type="text" class="form-control" placeholder="Escribe aquí...">
                </div>  
                <table class="table table-striped table-bordered table-responsive">
                    <thead>
                        <tr>
                            <th>Id est</th>
                            <th>Usuario</th>
                            <th>Nombre estudiante</th>
                            <th>Id Prof</th>
                            <!--<th>Profesor</th>-->
                            <th>Grupo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="searchable">
                        <%
                            int acc2 = 0;
                            String acc = null;
                            try {
                                String user = (String) session.getAttribute("username");
                                acc = (String) session.getAttribute("acc");
                                acc2 = Integer.parseInt(acc);
                                if (acc2 == 3) {
                                    ResultSet rs = null;
                                    ResultSet rs2 = null;
                                    rs = manejador.executeQuery("SELECT idUser, id FROM users");
                                    manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");

                                    rs2 = manejador.executeQuery("SELECT id_std, students.id_usu, idprofesor, nom_std, app_std, grp_std, nom_prof, apps_prof FROM students, profesc WHERE idprofesor=id_profe");
                                    while (rs2.next()) {
                                        out.println("<tr>");
                                        out.println("<th>"
                                                + rs2.getString("students.id_std")
                                                + "</th>");
                                        out.println("<th>"
                                                + rs2.getString("students.id_usu")
                                                + "</th>");
                                        out.println("<th>"
                                                + rs2.getString("students.nom_std")
                                                + " "
                                                + rs2.getString("students.app_std")
                                                + "</th>");
                                        out.println("<th>"
                                                + rs2.getString("profesc.nom_prof")
                                                + " "
                                                + rs2.getString("profesc.apps_prof")
                                                + "</th>");
                                        out.println("<th>"
                                                + rs2.getString("students.grp_std")
                                                + "</th>");
                                        out.println("<th>");
                                        out.println("<a class=\"btn btn-sm btn-info\" href=\"modificarEst.jsp?id="
                                                + rs2.getString("students.id_std")
                                                + "\" >Modificar</a>");
                                        out.println("<a class=\"btn btn-sm btn-info\" href=\"eliminarEst.jsp?id="
                                                + rs2.getString("students.id_usu")
                                                + "\">Eliminar privilegios</a> ");
                                        out.println("</th>");
                                        out.println("</tr>");

                                    }
                                } else {
                                    response.sendRedirect("index.jsp");
                                }
                            } catch (Exception e) {
                                System.err.println(e);
                                if(acc==null){
                                    System.out.println("Usuario no logueado");
                                    response.sendRedirect("errors.jsp?id='Sin privilegios suficientes'");
                                }
                                response.sendRedirect("index.jsp");
                            }

                        %>

                    </tbody>
                </table>
            </div>
        
        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>PAT</p>		
        </footer>
    </body>
</html>
