<%-- 
    Document   : cestado
    Created on : 09-ene-2016, 13:07:07
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        int Id = Integer.parseInt(request.getParameter("id"));
        int Std = Integer.parseInt(request.getParameter("std"));
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%@ page import="java.sql.*" %>
      <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            int result = 0;
            int estado = 0;
            ResultSet rs=null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/baseloginservlet");
            rs=manejador.executeQuery("SELECT estado FROM diagramasP WHERE id_dip='"+Id+"'");
            rs.next();
            estado = rs.getInt("diagramasP.estado");
            if(estado==0){
                estado=1;
            }else{
                estado=0;
            }
            result = manejador.executeUpdate("UPDATE diagramasP set estado="+estado+" where id_dip="+Id+"");
            
            System.out.println(result);
      %>
    </body>
</html>
