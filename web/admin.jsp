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
                    <a class="navbar-brand" href="index.jsp">Logo</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="admin.jsp">INICIO</a></li>
                        <li><a href="alumnos.jsp">Alumnos</a></li>
                        <li><a href="profs.jsp">Profesores</a></li>
                        <li><a href="profsp.jsp">Profesores+</a></li>
                        <li><a href="oats.jsp">OATs</a></li>
                        <li><a href="cursos.jsp">CURSOS</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 

        </div>

        <!-- Container (About Section) -->
        <div id="focused" class="container-fluid" >
            <div class="row">
                <div class="text-center">
                    <h2>Administración de Usuarios</h2><br>
                </div>
                <div class="text-center">
                    <h3>Agregar nuevo usuario</h3>
                </div>
                <div class="form-group text-center">                    
                    <s:form action="/Add">
                        <div class="col-sm-2">
                            <label for="Rol">Rol:</label>  
                            <select id="Rol" name="Rol" class="form-control">
                                <option value=1>Usuario registrado</option>
                                <option value=2>Estudiante</option>
                                <option value=3>Administrador</option>
                                <option value=4>Contribuidor</option>
                                <option value=5>Profesor escolar</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <label for="nombre">Nombre de usuario:</label>
                            <input type="text" placeHolder="Nombre de usuario"  name="username" required="true" id="nombre" class="form-control"/>
                        </div>
                        <div class="col-sm-2">
                            <label for="password">Contraseña:</label>  
                            <input type="password" placeHolder="Contraseña"  name="password" required="true" id="password" class="form-control"/>
                        </div>
                        <div class="col-sm-2">
                            <label for="email">Correo Electronico:</label>  
                            <input type="email" name="mail" id="email" placeHolder="Correo electronico" required="true" class="form-control"/>
                        </div>
                        <div class="col-sm-2">
                            <label for="submit">.</label><br>
                            <input type="submit" value="Registrar" class="btn btn-primary" id="submit"/>
                        </div>
                    </s:form>
                </div>
                <br><br><br>
                <div>
                    <div class="input-group"> <span class="input-group-addon">Busqueda</span>
                        <input id="filter" type="text" class="form-control" placeholder="Escribe aquí...">
                    </div>  
                    <table class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr>
                                <!--<th>Id</th>-->
                                <th>Nombre</th>
                                <th>Email</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="searchable">
                            <%@ page import="java.sql.*" %>
                            <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                            <%

                                try {
                                    String user = (String) session.getAttribute("username");
                                    String acc = (String) session.getAttribute("acc");
                                    int acc2 = Integer.parseInt(acc);
                                    if (acc2 == 3) {
                                        //out.println("Acceso autorizado<br>");

                                        String rol = "";
                                        int nivel = 1;
                                        ResultSet rs = null;
                                        ResultSet rs2 = null;
                                        String email = null;
                                        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");

                                        rs2 = manejador.executeQuery("SELECT idUser, id, rol, nivel, email FROM users");//id_usu, nom_usu, acc_usu FROM usuarios
                                        while (rs2.next()) {
                                            String acceso = "Usuario Registrado";
                                            if (rs2.getInt("users.nivel") == 2) {
                                                acceso = "Alumno";
                                            } else if (rs2.getInt("users.nivel") == 3) {
                                                acceso = "Administrador";
                                            } else if (rs2.getInt("users.nivel") == 4) {
                                                acceso = "Contribuidor";
                                            } else if (rs2.getInt("users.nivel") == 5) {
                                                acceso = "Profesor Escolar";
                                            }
                                            email = rs2.getString("users.email");
                                            out.println("<tr>");
                                            //out.println("<th>" + rs2.getString("users.idUser") + "</th>");
                                            out.println("<th>" + rs2.getString("users.id") + "</th>");
                                            if (email != null) {
                                                out.println("<th>" + rs2.getString("users.email") + "</th>");
                                            } else {
                                                out.println("<th> No tiene correo </th>");
                                            }
                                            out.println("<th>" + acceso + "</th>");
                                            //out.println("<th>"+rs2.getString("usuarios.acc_usu")+"</th>");
                                            out.println("<th>");
                                            out.println(" <a href='modificar.jsp?id=" + rs2.getString("users.idUser") + "#about' class=\"btn btn-info btn-sm\">Modificar usuario</a> ");
                                            out.println(" <a href='eliminar.jsp?id=" + rs2.getString("users.idUser") + "' class=\"btn btn-info btn-sm\">Eliminar usuario</a> ");
                                            out.println("</th>");
                                            out.println("</tr>");

                                        }
                                    } else {
                                        response.sendRedirect("index.jsp");
                                    }
                                } catch (Exception e) {
                                    //response.sendRedirect("index.jsp");
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