<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            int Id = Integer.parseInt(request.getParameter("id"));
            ResultSet rs = null;
            String nombre = "";
            String apellido = "";
            String nomcomp = "";
            manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
            rs = manejador.executeQuery("SELECT nom_prof, apps_prof FROM profesores WHERE id_usu='" + Id + "' ");
            while (rs.next()) {
                nombre = rs.getString("profesores.nom_prof");
                apellido = rs.getString("profesores.apps_prof");
                nomcomp = nombre + " " + apellido;
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
        <title>Confirmación</title>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <!--Banner y barra de navegación-->
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
        <!--Cuerpo de la pagina-->
        <div class="container">
            <div class="row well">
                <div class="col-md-6 col-md-offset-3">
                    <div class="row">
                        <h1 class="text-center">Confirmación de eliminación</h1>
                        <h3 class="text-center">¿Seguro que desea revocar privilegios de <b>Colaborador </b>al usuario<b> <%out.println(nomcomp);%></b>?</h3>
                        <s:form action="/DelProfG">
                            <input type="hidden" name="id" value=<%out.println(Id);%>/>
                            <input type="submit" value="Sí" class="btn btn-danger btn-block"/>
                            <a href="profsp.jsp" class="btn btn-primary btn-block">Regresar</a>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

