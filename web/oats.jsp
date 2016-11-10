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
        <script src="resources/busquedaTabla.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            
            String user = (String) session.getAttribute("username");
            String acc = (String) session.getAttribute("acc");
            int acc2 = Integer.parseInt(acc);
            //int acc2 = 3;
            

            ResultSet rs = null;
            ResultSet rs2 = null;
            ResultSet rsCursos = null;
            String consulta = "SELECT * FROM oats, profesores, cursos where oats.id_prof=profesores.id_usu;";
            try {
                if (acc2 == 3) {
                    manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                    rsCursos = manejador.executeQuery("SELECT id_curso, Nombre FROM cursos");
                    //rs2=manejador.executeQuery("SELECT * FROM oats, profesores where oats.id_prof=profesores.id_usu;");
                    rs2 = manejador.executeQuery(consulta);
                    rs = manejador.executeQuery("SELECT * FROM profesores;");
                } else {
                    System.out.println("Acceso denegado");
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("index.jsp");
            }
        %>
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
                        <li><a href="admin.js">INICIO</a></li>
                        <li><a href="alumnos.jsp#about">Alumnos</a></li>
                        <li><a href="profs.jsp#about">Profesores</a></li>
                        <li><a href="profsp.jsp#about">Profesores+</a></li>
                        <li><a href="oats.jsp#about#myPage">OATs</a></li>
                        <li><a href="cursos.jsp#about">CURSOS</a></li>
                        <li><a href="mensajes.jsp#about">MENSAJES</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 
        </div>
        <div class="text-center">
            <h2>Administración de OATs</h2>
        </div>
        <div  class="text-center">
            <h3>Menú Objetos de Aprendizaje Turistico</h3>
            <a href="oats.jsp#about" class="btn btn-default btn-lg">Creación de OATS</a>
            <a href="oats.jsp#lista" class="btn btn-default btn-lg">Lista de OATS</a>
        </div><br><br><br><br><hr>
        <!-- Container (About Section) -->
        <div id="about" class="container-fluid">
            <div class="text-center" id="crear">
                <h2>Crear un OAT</h2>
                <s:form action="/AddOAT" id="usrform" class="form-group">
                    <div class="text-center">
                        <div class="col-sm-2">
                            <label for="id">
                                Generador:
                            </label>
                            <select id="id" name="id" class="form-control">
                                <%
                                    while (rs.next()) {
                                        out.println("<option value=\""
                                                + rs.getString("profesores.id_usu") + "\">"
                                                + rs.getString("profesores.nom_prof") + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label for="titulo">
                                Titulo
                            </label>
                            <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Tiulo"/>
                        </div>
                        <div class="col-sm-3">
                            <label for="desc">
                                Descripción:
                            </label>
                            <input type="text" name="desc" id="desc" class="form-control" placeholder="Descripción"/>
                        </div>
                        <div class="col-sm-3">
                            <label for="curso">
                                Curso al que pertenece:
                            </label>
                            <!--<input type="text" name="curso" id="curso" class="form-control"/>-->
                            <select id="curso" name="curso" class="form-control">
                                <%
                                    while (rsCursos.next()) {
                                        out.println("<option value=\""
                                                + rsCursos.getString("cursos.id_curso") + "\">"
                                                + rsCursos.getString("cursos.Nombre") + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <!--<div class="col-sm-2">
                            <label for="fecha">
                                Fecha:
                            </label>
                            <input type="text" name="fecha" id="fecha"  disbled="true" class="form-control"/>
                        </div>-->
                        <div class="col-sm-1">
                            <br>
                            <input type="submit" class="btn btn-md btn-primary" value="Crear"/>
                        </div>
                    </div><br><br><br>
                    <div>
                        <textarea name="contenido" form="usrform" id="contenido" rows="20" cols="80"></textarea>
                    </div>
                </s:form><br>
                <a href="oats.jsp#myPage" class="btn btn-lg btn-default">Menú</a>
            </div><br><br><hr>
            <div class="row" id="lista">
                <div class="text-center">
                    <div><br><br>
                        <h2>OATs creados por profesores generadores de contenido</h2>
                    </div><br>
                    <div class="input-group"> <span class="input-group-addon">Busqueda</span>
                        <input id="filter" type="text" class="form-control" placeholder="Escribe aquí...">
                    </div> 
                    <table class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr>
                                <!--<th>Id oat</th>-->
                                <th>Creador</th>
                                <th>Titulo</th>
                                <th>Descripción</th>
                                <th>Fecha</th>
                                <th>Curso</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="searchable">
                            <%
                                //try {
                                    while (rs2.next()) {
                                        out.println("<tr>");
                                        //out.println("<th>" + rs2.getString("oats.id_oat") + "</th>");
                                        out.println("<th>" + rs2.getString("profesores.nom_prof") + " " + rs2.getString("profesores.apps_prof") + "</th>");
                                        out.println("<th>" + rs2.getString("oats.titulo") + "</th>");
                                        out.println("<th>" + rs2.getString("oats.descrip") + "</th>");
                                        out.println("<th>" + rs2.getString("oats.fecha") + "</th>");
                                        out.println("<th>" + rs2.getString("cursos.Nombre") + "</th>");
                                        out.println("<th>");
                                        out.println(" <a href='veroat.jsp?id=" + rs2.getString("oats.id_oat") + "#about' class=\"btn btn-sm btn-info\">Ver</a> ");
                                        out.println(" <a href='modificarOat.jsp?id=" + rs2.getString("oats.id_oat") + "#about' class=\"btn btn-sm btn-info\">Modificar</a> ");
                                        out.println(" <a href='eliminarOAt.jsp?id=" + rs2.getString("oats.id_oat") + "#about' class=\"btn btn-sm btn-info\">Eliminar</a>");
                                        out.println("</th>");
                                        out.println("</tr>");
                                    }
                                //} catch (Exception e) {
                                //    response.sendRedirect("index.jsp");
                                //}
                            %>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <a href="oats.jsp#myPage" class="btn btn-lg btn-default">Menú</a>
                    </div>
                </div>
            </div>
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
    <script>
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        //var editor = CKEDITOR.replace( 'contenido');
        //CKEDITOR.on('instanceLoaded', function(e) {e.editor.resize(700, 350)} );
        //editor.config.width('80','80');
        //editor.replace('contenido');
        CKEDITOR.replace('contenido');
    </script>
</html>
