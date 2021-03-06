<%-- 
    Document   : inscribirse
    Created on : 07-nov-2016, 22:08:54
    Author     : Asus
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            int Idc = Integer.parseInt(request.getParameter("idc"));
            int Idu = Integer.parseInt(request.getParameter("idu"));
            ResultSet rs=null;
            String nombre = "";
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs=manejador.executeQuery("SELECT Nombre FROM cursos WHERE id_curso='"+Idc+"' ");
            while(rs.next()){
                nombre = rs.getString("cursos.Nombre");
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
        <title>Inscribirse</title>
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
                        <li><a href="indexnus.jsp">INICIO</a></li>
                        <li><a href="mensajes.jsp">MENSAJES</a></li>
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
                        <h1 class="text-center">Confirmación de inscripción</h1>
                        <h3 class="text-center">¿Seguro que desea inscribirse al curso: <b><%out.println(nombre);%></b>?</h3>
                        <s:form action="/insc">
                            <input type="hidden" name="idc" value=<%out.println(Idc);%>/>
                            <input type="hidden" name="idu" value=<%out.println(Idu);%>/>
                            <input type="submit" value="Sí" class="btn btn-danger btn-block"/>
                            <a href="cursosgen.jsp#focused" class="btn btn-primary btn-block">Regresar</a>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
