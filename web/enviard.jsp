<%-- 
    Document   : enviard
    Created on : 13-ene-2016, 9:41:38
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            System.out.println("Entrando a enviard");
            int idD = Integer.parseInt(request.getParameter("idD"));
            response.setContentType("text/plain");
            
        %>
        <%
            int result = 0;
            ResultSet rs=null;
            out.print("PRUEBA");
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/baseloginservlet");
            rs = manejador.executeQuery("SELECT diagrama FROM diagramasp WHERE id_dip="+idD+";");
            rs.next();
            out.print(rs.getString("diagramasp.diagrama"));
            //result = manejador.executeUpdate("UPDATE diagramasP set estado="+estado+" where id_dip="+Id+"");
            
            System.out.println(result);
      %>
    </body>
</html>
