<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
<%
    ResultSet profesores = null;
    ResultSet rs2 = null;
    int acc2 = 1;
    String acc=null;
    String user=null;
    try {
        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
        rs2 = manejador.executeQuery("select * from cursos, profesores where cursos.id_prof=profesores.id_usu;");
        profesores = manejador.executeQuery("SELECT id_usu, nom_prof, apps_prof from profesores;");
        user = (String) session.getAttribute("username");
        acc = (String) session.getAttribute("acc");
        acc2 = Integer.parseInt(acc);
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }
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
        <script src="resources/bootbox.min.js"></script>
        <script src="resources/formularios.js"></script>
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
                            <%
                                String opciones = null;
                                try {
                                    //String user = (String) session.getAttribute("username");
                                    //String acc = (String) session.getAttribute("acc");
                                    //System.out.println("myAcc=" + acc);
                                    if (user == null && acc == null) {
                                        opciones = "<li><a href=\"articulos.jsp\">Artículos</a></li>"
                                                + "<li><a href=\"mensajes.jsp\">Mensajes</a></li>"
                                                + "<li><a href=\"#login\">LOGIN</a></li>";
                                    } else if (acc.equals("1")) {
                                        opciones = "<li><a href=\"index.jsp\">Inicio</a></li>"
                                                + "<li><a href=\"articulos.jsp\">Artículos</a></li>"
                                                + "<li><a href=\"mensajes.jsp\">Mensajes</a></li>"
                                                + "<li><a href=\"indexnus.jsp\">" + user + "</a></li>";
                                    } else if (acc.equals("2")) {
                                        opciones = "<li><a href=\"articulos.jsp\">Artículos</a></li>"
                                                + "<li><a href=\"mensajes.jsp\">Mensajes</a></li>"
                                                + "<li><a href=\"cursosgen.jsp\">Cursos</a></li>"
                                                + "<li><a href=\"indexalumn.jsp\">" + user + "</a></li>";
                                    } else if (acc.equals("3")) {
                                        opciones = "<li><a href=\"admin.jsp\">Inicio</a></li>"
                                                + "<li><a href=\"articulos.jsp\">Artículos</a></li>"
                                                + "<li><a href=\"alumnos.jsp\">Alumnos</a></li>"
                                                + "<li><a href=\"profs.jsp\">Profesores</a></li>"
                                                + "<li><a href=\"profsp.jsp\">Colaboradores</a></li>"
                                                + "<li><a href=\"oats.jsp\">OA</a></li>"
                                                + "<li><a href=\"cursos.jsp\">Cursos</a></li>"
                                                + "<li><a href=\"mensajes.jsp\">Mensajes</a></li>"
                                                + "<li><a href=\"indexnus.jsp\">" + user + "</a></li>";
                                    } else if (acc.equals("4")) {
                                        opciones = "<li><a href=\"articulos.jsp\">Artículos</a></li>"
                                                + "<li><a href=\"mensajes.jsp\">Mensajes</a></li>"
                                                + "<li><a href=\"indexprofp.jsp\">" + user + "</a></li>";
                                    } else if (acc.equals("5")) {
                                        opciones = "<li><a href=\"indexprofesc.jsp\">Inicio</a></li>"
                                                + "<li><a href=\"articulos.jsp\">Artículos</a></li>"
                                                + "<li><a href=\"mensajes.jsp\">Mensajes</a></li>"
                                                + "<li><a href=\"indexnus.jsp\">Mi cuenta</a></li>";
                                    }
                                    out.println(opciones);
                                } catch (Exception e) {
                                    System.err.println(e);
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
        <div class="text-center" id="creacion">
            <h2>Crear nuevo curso</h2>
            <s:form action="/AddCurso" id="ncurso" class="form-group">
                <div class="col-sm-3">
                    <label for="idu">Profesor responsable</label>
                    <!--<input type ="number" name="idu" id="idu" class="form-control"/>-->
                    <select type ="number" name="idu" id="idu" class="form-control">
                        <%
                            while (profesores.next()) {
                                out.println(
                                        "<option value=\""
                                        + profesores.getString("id_usu")
                                        + "\">"
                                        + profesores.getString("nom_prof")
                                        + "</option>");
                            }
                        %>
                    </select>
                </div>
                <div class="col-sm-2">
                    <label for="nombre">Nombre del curso</label>
                    <input type ="text" name="nombre" id="nombre" class="form-control"/>
                </div>
                <div class="col-sm-4 row-sm-3">
                    <label for="desc">Descripción:</label>
                    <textarea name="desc" form="ncurso" id="texto" rows="5" cols="20" class="form-control"></textarea>
                </div>
                <div class="col-sm-2 row-sm-3"><br>
                    <input type="submit" value="Registrar" class="btn btn-info btn-md"/><br><br><br><br><br>
                </div>
            </s:form>
        </div>
        
        <!-- Container (About Section) -->
        <div id="about" class="container-fluid text-center">
            <div class="row">
                <div>
                    <h2>Administración de Cursos</h2><br>
                </div>
                <s:form action="/DelCurso" id="delForm">
                    <input type="hidden" value="null" name="id_curso" id="hIn"/>
                </s:form>
                <div>
                    <table class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Responsable</th>
                                <th>Descripción</th>
                                <th>Lugares disponibles</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i =0;
                                if (acc2 == 3) {
                                    //out.println("Acceso autorizado<br>");
                                    while (rs2.next()) {
                                        i += 1;
                                        out.println("<tr>");
                                        out.println("<th>" + rs2.getString("cursos.id_curso") + "</th>");
                                        out.println("<th>" + rs2.getString("cursos.Nombre") + "</th>");
                                        out.println("<th>" + rs2.getString("profesores.nom_prof") + " " + rs2.getString("profesores.apps_prof") + "</th>");
                                        out.println("<th>" + rs2.getString("cursos.Descripcion") + "</th>");
                                        out.println("<th>" + rs2.getString("cursos.Lugares") + "</th>");
                                        //out.println("<th>"+rs2.getString("usuarios.acc_usu")+"</th>");
                                        out.println("<th>");

                                        out.println(" <a href='vercurso.jsp?id=" + rs2.getString("cursos.id_curso") + "' class=\"btn btn-info btn-md\" >Ver curso</a>");
                                        out.println("<input type=\"button\" onclick=\"submitform(\'delForm\', \'hIn\', '" + rs2.getString("cursos.id_curso") + "', '" + rs2.getString("cursos.Nombre") + "')\" value=\"Borrar\" class=\"btn btn-warning\"/>");
                                        out.println("</th>");
                                        out.println("</tr>");
                                    }
                                } else {
                                    //response.sendRedirect("errors.jsp");
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
