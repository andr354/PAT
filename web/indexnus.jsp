<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <head>
        <script src="resources/verificar.js" type="text/javascript"></script>
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
                        <li><a href="indexnus.jsp">Inicio</a></li>
                        <li><a href="cursosgen.jsp">Cursos</a></li>
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
                    </ul>
                </div>
            </div>
        </nav>
        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 
        </div>

        <div id="focused" class="row container-fluid" >
            <div class="row">
                <div class="text-center">
                    <h2>Cursos en los que estas inscrito actualmente: </h2><br>
                </div>
            </div>
            <!--</div>-->
            <div class="row col-md-8 col-md-offset-2">
                <table class="table table-striped table-bordered table-responsive">
                    <thead>
                        <tr>
                            <th>Curso</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%@ page import="java.sql.*" %>
                        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                        <%
                            int acc2 = 0;
                            int idu = 0;
                            try {
                                String user = (String) session.getAttribute("username");
                                String acc = (String) session.getAttribute("acc");
                                acc2 = Integer.parseInt(acc);
                                if (acc.equals(null)) {
                                    response.sendRedirect("index.jsp");
                                }
                                idu = 1;
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                rs = manejador.executeQuery("SELECT idUser FROM users WHERE users.id='" + user + "'");
                                if (rs.next()) {
                                    idu = rs.getInt("users.idUser");
                                }
                                rs2 = manejador.executeQuery("SELECT nombre, cursos.id_curso FROM cursos, inscritos  WHERE inscritos.id_usu=" + idu + " and inscritos.id_curso=cursos.id_curso;");

                                //out.println("<div class=\"container\">");
                                while (rs2.next()) {
                                    out.println("<tr>");
                                    out.println("<th><div class='col col-md-10'>"
                                            + "<a href='vercurso.jsp?id=" + rs2.getString("cursos.id_curso") + "'>" + rs2.getString("cursos.nombre") 
                                            + "</a></th></div>");
                                    out.println("<th><div class='col col-md-4'>");
                                    out.println("<a class=\"btn btn-info btn-block\" href='vercurso.jsp?id=" + rs2.getString("cursos.id_curso") + "'>Ver curso</a>"
                                            + "</div>");
                                    out.println("</th>");
                                    out.println("</tr>");
                                }
                            } catch (Exception e) {
                                response.sendRedirect("index.jsp");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div id="about" class="container-fluid text-center row col-md-10 col-md-offset-1">
            <div class="row">       
                <div class="text-center">
                    <h3>Editar perfil</h3>
                    <s:form action="/Mod" class="form-group">
                        <table class="table table-striped table-bordered table-responsive">
                            <thead>
                                <tr>
                                    <th>Nombre de usuario</th>
                                    <th>Password</th>
                                    <th>Correo</th>
                                    <th>Intereses (separados por comas)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%@ page import="java.sql.*" %>
                                <%
                                    String user = (String) session.getAttribute("username");
                                    idu = 0;
                                    ResultSet rs = null;
                                    ResultSet rs2 = null;
                                    manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                    rs = manejador.executeQuery("SELECT idUser FROM users WHERE users.id='" + user + "'");
                                    out.println(user);
                                    if (rs.next()) {
                                        idu = rs.getInt("users.idUser");
                                    }
                                    rs2 = manejador.executeQuery("SELECT idUser, id, password, nivel, email, intereses FROM users WHERE idUser='" + idu + "' ");
                                    while (rs2.next()) {
                                        out.println("<tr><input type=\"hidden\" name=\"id\" value=" + idu + " class=\"form-control\"/>");
                                        out.println("<th><input type=\"text\" name=\"username\" placeholder=\"" + rs2.getString("users.id") + "\" value=\"" + rs2.getString("users.id") + "\" class=\"form-control\"/></th>");
                                        out.println("<th><input type=\"password\" name=\"password\" placeholder=\"Contraseña\" value=\"" + rs2.getString("users.password") + "\" class=\"form-control\"/></th>");
                                        if (rs2.getString("users.email") != null) {
                                            out.println("<th><input type=\"email\" name=\"mail\" placeholder=\"" + rs2.getString("users.email") + "\" value=\"" + rs2.getString("users.email") + "\" class='form-control'/></th>");
                                        } else {
                                            out.println("<th><input type=\"email\" name=\"mail\" placeholder=\"Correo electronico\" value=\"No tiene\" class=\"form-control\" /></th>");
                                        }
                                        if (rs2.getString("users.intereses") != null) {
                                            out.println("<th><input type=\"text\" name=\"intereses\" placeholder=\"" + rs2.getString("users.intereses") + "\" value=\"" + rs2.getString("users.intereses") + "\" class=\"form-control\" /></th>");
                                        } else {
                                            out.println("<th><input type=\"text\" name=\"intereses\" placeholder='Intereses' value='ninguno' class=\"form-control\" /></th>");
                                        }
                                        out.println("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                        <div class="col-sm-4 col-md-offset-4">
                            <input type="submit" class="btn-warning btn-xl  form-control" value="Actualizar perfil"/>      
                        </div>
                    </s:form><br><hr>
                    <%
                        if (acc2 == 1) {
                            out.println("<h3>Cambiar privilegios</h3>"
                                    + "<div class='row col-md-8 col-md-offset-2 text-center well'>"
                                    + "<div class='col-md-5 col-md-offset-1'><a href='registrostd.jsp?id=" + idu + "' class='btn btn-success btn-md btn-block'>Alumno</a></div>"
                                    + "<div class='col-md-5'><a href='registroprf.jsp?id=" + idu + "' class='btn btn-success btn-md btn-block'>Profesor escolar</a></div>"
                                    + "</div><br><br><br>");
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="row col-md-12">
            <footer class="container-fluid text-center">
                <h2 class="text-center">Cerrar Sesión</h2>
                <center>
                <button type="button" onclick="loadDoc();" class="btn btn-danger">Cerrar Sesión</button>
                </center>
                <a href="#myPage" title="To Top">
                    <span class="glyphicon glyphicon-chevron-up"></span>
                </a>
                <p>PAT</p>		
            </footer>
        </div>
    </body>
</html>