<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <%
        int Id = 1;
        try {
            Id = Integer.parseInt(request.getParameter("id"));
            System.out.println(Id);
        } catch (Exception e) {
            System.out.println(e);
        }
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
            <%@ page import="java.sql.*" %>
            <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
            <div class="row">
                <div class="col-sm-8">
                    <h2>Modificar Usuario Alumno</h2><br>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-wrench logo"></span>
                </div>
                <div class="col-sm-8 col-sm-offset-2 text-center">
                    <h2 class="text-center">Datos actuales del alumno</h2>
                    <s:form action="/ModEst" class="form-horizontal form-control">
                            <table class="table table-striped table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <th>Nombre(s)</th>
                                        <th>Apellido(s)</th>
                                        
                                        <th>Profesor</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            String user = (String) session.getAttribute("userName");
                                            String rol = "";
                                            int nivel = 1;
                                            ResultSet rs = null;
                                            ResultSet rs2 = null;
                                            try {
                                                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                                rs2 = manejador.executeQuery("SELECT  profesc.id_profe, profesc.nom_prof FROM profesc ;");
                                                rs = manejador.executeQuery("SELECT students.*, nom_prof, apps_prof, id_profe FROM students, profesc WHERE students.id_std=" + Id + " AND profesc.id_profe=students.idprofesor;");
                                                while (rs.next()) {
                                                    out.println("<input type=\"hidden\" value=\"" + Id + "\" name=\"id\" class=\"form-control\"/>");
                                                    out.println("<th><input type=\"text\" value=\""
                                                            + rs.getString("students.nom_std")
                                                            + "\" name=\"noms\" class=\"form-control\"  placeholder=\"" + rs.getString("students.nom_std") + "\"/></th>");

                                                    out.println("<th><input type=\"text\" value=\""
                                                            + rs.getString("students.app_std")
                                                            + "\" name=\"apps\" class=\"form-control\" placeholder=\"" + rs.getString("students.app_std") + "\"/></th>");
                                                    /*out.println("<th>"
                                                            + rs.getString("students.idprofesor")
                                                            + "</th>");*/
                                                    out.println("<th><select type=\"number\" name=\"idprof\" class=\"form-control\">"
                                                            //+ rs.getString("profesc.nom_prof")
                                                            + " ");
                                                    while (rs2.next()) {
                                                        out.println("<option value=" + rs2.getString("profesc.id_profe")+">" + rs2.getString("profesc.nom_prof") + "</option>");
                                                    }
                                                    out.println("</select></th>");
                                                }
                                            } catch (Exception e) {
                                                System.out.println(e);
                                            }
                                        %>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="col-sm-6">
                                <a href="alumnos.jsp" class="btn btn-primary btn-xl form-control">Regresar</a>            
                            </div>
                            <div class="col-sm-6">
                                <input type="submit" class="btn-warning btn-xl  form-control" value="Modificar"/>      
                            </div>
                        <!--</div>-->
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

