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
        <div id="about" class="container-fluid text-center">
            <div class="row">
                <div class="text-center">
                    <h2>Modificar usuario</h2><br>
                </div>
                <div class="col-sm-8 col-md-offset-2 text-center">
                    <h3>Datos actuales del usuario</h3>
                    <div class="text-center">
                        <s:form action="/Mod" class="form-group">
                            <table class="table table-striped table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Password</th>
                                        <th>Correo</th>
                                        <th>Rol</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%@ page import="java.sql.*" %>
                                    <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                                    <%
                                        String user = (String) session.getAttribute("userName");
                                        String rol = "";
                                        int nivel = 1;
                                        ResultSet rs = null;
                                        ResultSet rs2 = null;
                                        String usuario = "<option value=1>Usuario registrado</option>";
                                        String alumno = "<option value=2>Alumno</option>";
                                        String admin = "<option value=3>Administrador</option>";
                                        String contribuidor = "<option value=4>Contribuidor</option>";
                                        String profesor = "<option value=5>Profesor escolar</option>";
                                        manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                        rs2 = manejador.executeQuery("SELECT idUser, id, password, nivel, email FROM users WHERE idUser='" + Id + "' ");
                                        while (rs2.next()) {
                                            String acceso = "<option value=" + rs2.getInt("users.nivel") + " selected=\"selected\">";
                                            if (rs2.getInt("users.nivel") == 1) {
                                                acceso += "Usuario registrado</option>"
                                                        + alumno
                                                        + admin
                                                        + profesor
                                                        + contribuidor;
                                            } else if (rs2.getInt("users.nivel") == 2) {
                                                acceso += "Alumno</option>"
                                                        + usuario
                                                        + admin
                                                        + profesor
                                                        + contribuidor;
                                            } else if (rs2.getInt("users.nivel") == 3) {
                                                acceso += "Administrador</option>"
                                                        + usuario
                                                        + alumno
                                                        + profesor
                                                        + contribuidor;
                                            } else if (rs2.getInt("users.nivel") == 4) {
                                                acceso += "Contribuidor</option>"
                                                        + usuario
                                                        + alumno
                                                        + profesor
                                                        + admin;
                                            } else if (rs2.getInt("users.nivel") == 5) {
                                                acceso += "Profesor escolar</option>"
                                                        + usuario
                                                        + alumno
                                                        + admin
                                                        + contribuidor;
                                            } else {
                                                acceso += "<option value=1 selected=\"selected\"> Usuario registrado </option>"
                                                        + alumno
                                                        + admin
                                                        + contribuidor
                                                        + profesor;
                                            }
                                            out.println("<tr><input type=\"hidden\" name=\"id\" value=" + Id + " class=\"form-control\"/>");
                                            out.println("<th><input type=\"text\" name=\"username\" placeholder=\"" + rs2.getString("users.id") + "\" value=\"" + rs2.getString("users.id") + "\" class=\"form-control\"/></th>");
                                            out.println("<th><input type=\"password\" name=\"password\" placeholder=\"Contraseña\" value=\"" + rs2.getString("users.password") + "\" class=\"form-control\"/></th>");
                                            if (rs2.getString("users.email") != null) {
                                                out.println("<th><input type=\"email\" name=\"mail\" placeholder=\"" + rs2.getString("users.email") + "\" value=\"" + rs2.getString("users.email") + "\"/></th>");
                                            } else {
                                                out.println("<th><input type=\"email\" name=\"mail\" placeholder=\"Correo electronico\" value=\"No tiene\" class=\"form-control\"/></th>");
                                            }
                                            out.println("<th><select name=\"rol\" class=\"form-control\">" + acceso + "</select></th>");
                                            out.println("</tr>");
                                        }
                                    %>
                                </tbody>
                            </table>
                            <div class="col-sm-6">
                                <a href="admin.jsp#focused" class="btn btn-primary btn-xl form-control">Regresar</a>            
                            </div>
                            <div class="col-sm-6">
                                <input type="submit" class="btn-warning btn-xl  form-control" value="Modificar"/>      
                            </div>
                        </div>
                    </s:form>
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
