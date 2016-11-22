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
        <script src="//cdn.ckeditor.com/4.5.1/full-all/ckeditor.js"></script>
        <script src="resources/jquery-1.7.1.min"></script>
        <script src="resources/busquedaT.js"></script>
        <%
            int grupo = 0;
            String g = null;
            try {
                g = (String) request.getParameter("grupo");
                if (g != null) {
                    grupo = Integer.parseInt(g);
                    System.out.println("ids de grupos: " + g + "= " + grupo);
                } else {
                    System.out.println("El id del grupo no existe: " + g);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
    </head>
    <body>
        <script>
            function capturar()
            {
                var porId = document.getElementById("nombre").value;
                //document.getElementById("resultado").innerHTML=" <br>Por ID: "+porId+" ";
                var pagina = "indexprofesc.jsp?grupo=";
                var paginaF = pagina.concat(porId);
                location.href = paginaF;

            }

            function crear()
            {
                var porId = document.getElementById("grupo").value;
                var porId2 = document.getElementById("prof").value;
                var porId3 = document.getElementById("desc").value;
                //document.getElementById("resultado").innerHTML=" <br>Por ID: "+porId+" ";
                var pagina = "ejemplo1.jsp?grupo=";
                var paginaF = pagina.concat(porId);
                var paginaF2 = paginaF.concat("&prof=");
                var paginaF3 = paginaF2.concat(porId2);
                var paginaF4 = paginaF3.concat("&desc=");
                var paginaF5 = paginaF4.concat(porId3);
                location.href = paginaF5;

            }

            function csesion() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        //document.getElementById(""+snd+"").innerHTML = eestd;
                    }
                };
                xhttp.open("POST", "csesion.jsp", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("user=x");
                location.href = "index.jsp";
            }

            function loadDoc(snd, std) {
                //alert("Cambiando: "+snd+" estado: "+std);
                var xhttp = new XMLHttpRequest();
                var est = 0;
                if (std == 0) {
                    est = 1;
                }
                var eestd = document.getElementById("" + snd + "").innerHTML;
                if (eestd == 0) {
                    eestd = 1;
                } else {
                    eestd = 0;
                }
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("" + snd + "").innerHTML = eestd;
                    }
                };
                xhttp.open("POST", "cestado.jsp", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("id=" + snd + "&std=" + est);
                //location.href = "professorIndex.jsp?grupo=0";
            }
        </script>    
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
                            <li><a href="indexprofesc.jsp">Inicio</a></li>
                            <li><a href="mensajes.jsp">Mensajes</a></li>
                            <%
                                try {
                                    String user = (String) session.getAttribute("username");
                                    String acc = (String) session.getAttribute("acc");
                                    if (user == null && acc == null) {
                                        out.println("<li><a href=\"#login\">LOGIN</a></li>");
                                    } else {
                                        out.println("<li><a href=\"indexnus.jsp\">" + user + "</a></li>");
                                    }
                                } catch (Exception e) {
                                }
                            %>
                            <%
                                String user = null;
                                String acc = null;
                                String rol = "";
                                int idP = 1;
                                int idPr = 1;
                                int nivel = 1;
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                ResultSet rs3 = null;
                                ResultSet rss = null;
                                try {
                                    user = (String) session.getAttribute("username");
                                    acc = (String) session.getAttribute("acc");
                                    if (Integer.parseInt(acc) != 5) {
                                        response.sendRedirect("index.jsp");
                                    }
                                    manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                    rs = manejador.executeQuery("SELECT rol, nivel, idUser FROM users WHERE users.id='" + user + "'"); //"+user+"
                                    if (grupo == 0) {
                                        rs2 = manejador.executeQuery("SELECT * FROM users, students WHERE nivel=2 and idUser=id_usu ");
                                    } else {
                                        rs2 = manejador.executeQuery("SELECT * FROM users, students WHERE nivel=2 and idUser=id_usu and grp_std='" + grupo + "' ");
                                    }
                                    if (rs.next()) {
                                        rol = rs.getString("Users.rol");
                                    }
                                    nivel = rs.getInt("Users.nivel");
                                    idP = rs.getInt("Users.idUser");
                                    if (nivel == 0 || idP == 0) {
                                        System.out.println("nivel");
                                    }
                                    System.out.println("Nivel: " + nivel + "; Usuario: " + idP);
                                    rss = manejador.executeQuery("SELECT id_profe FROM profesc WHERE id_usu=" + idP + "");
                                    if (rss.next()) {
                                        idPr = rss.getInt("profesc.id_profe");
                                    }

                                    rs3 = manejador.executeQuery("SELECT * FROM oats WHERE id_prof='" + idP + "' ");
                                    //manejador.closeConnection();
                                    //out.println("<h1>Bienvenido "+rol+" : "+user+"</h1>");

                                } catch (Exception e) {
                                    System.out.println(e);
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
                <br><br>
                <h2>Alumnos activos actualmente:</h2>
                <!--<div class="row col-sm-4 col-md-offset-2">
                    Ver solo el grupo: 
                    <form id="form1">
                        <br><input type="number" id="nombre" class="formulario">
                    </form>
                    <input type="button" value="Filtrar" onclick="capturar()">
                </div>-->
                <div class="container">
                    <!--<input type="text" id="search" placeholder="Ingrese el numero de grupo">-->
                    <label for="search">Filtrar por grupo:</label>
                    <input type="number" id="search" class="form-control" placeholder="Ingrese el numero de grupo"/>
                    <table id="table" class="table table-striped table-bordered table-responsive" >
                        <!--<thead>-->
                        <tr class="header">
                            <th>Nombre</th>
                            <th>Grupo</th>
                            <th>Acciones</th>
                        </tr>
                        <!--</thead>-->
                        <!--<tbody>-->
                        <%
                            //String user = (String)session.getAttribute("username");
                            try {
                                //System.out.println("-" + rol + "-");
                                while (rs2.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + rs2.getString("students.nom_std") + " " + rs2.getString("students.app_std") + "</td>");
                                    out.println("<td>" + rs2.getString("students.grp_std") + "</td>");
                                    out.println("<td><a class=\"btn btn-info\" href='diagramas.jsp?id=" + rs2.getString("students.id_std") + "&idu=" + rs2.getString("users.idUser") + "&idp=" + idP + "'>Ver participaciones</a>");
                                    out.println("<a class=\"btn btn-info\" href='asignargpo.jsp?id=" + rs2.getString("students.id_usu") + "'>Asignar grupo</a>");
                                    out.println("</td>");
                                    out.println("</tr>");

                                }
                            } catch (Exception e) {
                                System.out.println(e);
                            }
                        %>

                        <!--</tbody>-->
                    </table>
                </div>

                <br><br>
                <h2>OATs creados:</h2>
                <div class="container">
                    <table id="table2" class="table table-striped table-bordered table-responsive">
                        <!--<thead>-->
                        <tr class="header">
                            <th>Id</th>
                            <th>Descripción</th>
                            <th>Grupo</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                        <!--</thead>-->
                        <!--<tbody>-->
                        <%
                            try {
                                while (rs3.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + rs3.getInt("oats.id_oat") + "</td>");
                                    out.println("<td>" + rs3.getString("oats.descrip") + "</td>");
                                    out.println("<td>" + rs3.getInt("oats.grupo") + "</td>");
                                    out.println("<td id=\"" + rs3.getInt("oats.id_oat") + "\">" + rs3.getInt("oats.estado") + "</td>");
                                    out.println("<td>");
                                    out.println("<button type=\"button\" onclick=\"loadDoc(" + rs3.getInt("oats.id_oat") + "," + rs3.getInt("oats.estado") + ")\" class=\"btn btn-info\">Cambiar estado</button>");
                                    out.println("<a href='eliminarOAt.jsp?id=" + rs3.getInt("oats.id_oat") + "' class=\"btn btn-danger\">Eliminar</a>");
                                    out.println("<a href='veroat2.jsp?id=" + rs3.getInt("oats.id_oat") + "' class=\"btn btn-success\">Ver</a>");
                                    out.println("</td>");
                                    out.println("</tr>");

                                }
                            } catch (Exception e) {
                                System.out.println(e);
                            }
                        %>
                        <!--</tbody>-->
                    </table>
                </div>
            </div>
        </div>
        <h2>Agregar nuevo OAT</h2>
        <s:form action="/AddOAT" id="usrform">
            <div class="row col-md-6 col-md-offset-3 text-center">
                <input type="submit" class="btn btn-info form-control" value="Crear">
            </div>
            <div class="row col-md-10 col-md-offset-1 text-center">
                <div class="col col-md-2 text-center">
                    <label for="id">ID de generador</label>
                    <input type="number" name="id" class="form-control" id="id" placeholder="ID de generador"/>
                </div>
                <div class="col col-md-3 text-center">
                    <label for="titulo">Titulo</label>
                    <input type ="text" name="titulo" id="titulo" class="form-control"/>
                </div>
                <div class="col col-md-5 text-center">
                    <label for="desc">Descripción</label>
                    <input type="text" name = "desc" id="desc" class="form-control"/>
                </div>
                <div class="col col-md-2 text-center">
                    <label for="curso">Curso del (OAT)</label>
                    <input type="number" name = "curso" id="curso" class="form-control"/>
                </div>
            </div>
            <div class="row col-md-10 col-md-offset-1 text-center">
                <textarea name="contenido" form="usrform" id="contenido" rows="20" cols="80"></textarea>
                <script>
                    // Replace the <textarea id="editor1"> with a CKEditor
                    // instance, using default configuration.
                    CKEDITOR.replace('contenido');
                </script>
            </div>
        </s:form>
    <div class="row">
        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>PAT</p>		
        </footer>
    </div>
    </body>
</html>
