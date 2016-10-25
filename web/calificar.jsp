<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
    %>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Añadir usuario</title>
</head>
<body bgcolor="white">
<center>
<br>
        <h1>Calificar Participaciones</h1>
      <%@ page import="java.sql.*" %>
      <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
      <h4>Detalle de participación</h4>
        <%
            String user = (String)session.getAttribute("userName");
            String rol = "";
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/baseloginservlet");
            rs2=manejador.executeQuery("SELECT * FROM diagramas WHERE id_dig='"+Id+"' ");
             out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Descripción</th>");
            out.println("<th>Calificación</th>");
            out.println("<th>Notas profesor</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("diagramas.id_dig")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.descripcion")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.calif")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.notaP")+"</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
      %>
        <s:form action="/Cal">
            <s:textfield type="number" placeHolder="Calificación" name="calif" required="true"/><br>
            <s:textfield placeHolder="Anotaciones" name="nts" required="true"/><br>
            <input type="hidden" name="id" value=<%out.println(Id);%>/>
            <br>
            <s:submit value="Guardar cambios" />
        </s:form>
            <!--Dice que no pero si jala chido-->
</center>
</body>
</html>
