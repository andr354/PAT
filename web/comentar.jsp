<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
        int Ide = Integer.parseInt(request.getParameter("ide"));
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
        <h1>Comentar diagrama</h1>
      <%@ page import="java.sql.*" %>
      <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            String user = (String)session.getAttribute("userName");
            String rol = "";
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/baseloginservlet");
            rs2=manejador.executeQuery("SELECT id_dip, descrip, descripcion, notaP, calif FROM diagramasp, diagramas WHERE id_dip='"+Id+"' and id_dip=id_dgp");
            out.println("<h2>Detalle de diagrama</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Descripción</th>");
            out.println("<th>Mi comentario</th>");
            out.println("<th>Nota del profesor</th>");
            out.println("<th>Calificación otorgada</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("diagramasP.id_dip")+"</th>");
                out.println("<th>"+rs2.getString("diagramasP.descrip")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.descripcion")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.notaP")+"</th>");
                out.println("<th>"+rs2.getInt("diagramas.calif")+"</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
      %>
        <s:form action="/Com">
            <s:textfield placeHolder="Comentario" name="cmt" /><br>
            <input type="hidden" name="id" required="true" value=<%out.println(Id);%> />
            <input type="hidden" name="ide" required="true" value=<%out.println(Ide);%> />
            <br>
            <s:submit value="Guardar cambios" />
        </s:form>
            <!--Dice que no pero si jala chido-->
</center>
</body>
</html>
