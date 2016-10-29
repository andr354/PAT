<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            int Id = Integer.parseInt(request.getParameter("id"));
            ResultSet rs=null;
            String nombre = "";
            String apellido = "";
            String nomcomp = "";
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs=manejador.executeQuery("SELECT nom_std, app_std FROM students WHERE id_usu='"+Id+"' ");
            while(rs.next()){
                nombre = rs.getString("students.nom_std");
                apellido = rs.getString("students.app_std");
                nomcomp = nombre + " " +apellido;
            }
        %>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
<body>
    <center>
	<h1>Confirmar eliminar</h1>
        <br><br><br>
        <h2>¿Seguro que desea quitar privilegios de alumno al usuario <%out.println(nomcomp);%> ?</h2>
        <br><br><br>
        <s:form action="/DelEst">
            <input type="hidden" name="id" value=<%out.println(Id);%>/>
            <br>
            <s:submit value="Si, eliminar" />
        </s:form>
    </center>
</body>
</html>
