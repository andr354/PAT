<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
    </head>
    <body>
    <center>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
        </style>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            String user = (String)session.getAttribute("username");
            String rol = "";
            int nivel = 1;
            int idU = 1;
            int idS = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            ResultSet rs3 = null;
            
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/BaseLoginServlet");
            rs=manejador.executeQuery("SELECT Users.rol, nivel, idUser, id_std FROM Users, students WHERE Users.id='"+user+"' and idUser=id_usu"); //"+user+"
            if(rs.next())
                rol = rs.getString("Users.rol");
                nivel = rs.getInt("Users.nivel");
                idU = rs.getInt("Users.idUser");
                idS = rs.getInt("students.id_std");;
            rs2=manejador.executeQuery("SELECT distinct diagramasP.id_dip, diagramasP.descrip, students.id_std FROM diagramasP, students, diagramas  WHERE  students.id_usu='"+idU+"' and diagramasP.grupo=students.grp_std and estado=1"); //and id_dgp=id_dip
            //diagramas.descripcion es el comentario que hace el estudiante
            out.println("<h2>Diagramas asignados a tu grupo</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Descripción</th>");
            //out.println("<th>Mi comentario</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("diagramasP.id_dip")+"</th>");
                out.println("<th>"+rs2.getString("diagramasP.descrip")+"</th>");
                //out.println("<th>"+rs2.getString("diagramas.descripcion")+"</th>");
                out.println("<th>");
                out.println("<a href='mostrard.jsp?id="+rs2.getString("diagramasP.id_dip")+"'>Ver Diagrama</a> |");
                out.println("<a href='comentar.jsp?id="+rs2.getString("diagramasP.id_dip")+"&ide="+rs2.getInt("students.id_std")+"'>Comentar</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            
            
            rs3=manejador.executeQuery("SELECT distinct diagramasP.id_dip, diagramasP.descrip, students.id_std FROM diagramasP, students, diagramas  WHERE estado=0 and students.id_usu='"+idU+"' and diagramasP.grupo=students.grp_std");
            out.println("<h2>Tus calificaciones</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Diagrama</th>");
            out.println("<th>Descripción</th>");
            //out.println("<th>Mi comentario</th>");
            out.println("<th>Calificación</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            int cuenta = 1;
            int total = 0;
            int res = 0;
            
            while(rs3.next()){
                out.println("<tr>");
                out.println("<th>"+rs3.getString("diagramasP.id_dip")+"</th>");
                out.println("<th>"+rs3.getString("diagramasP.descrip")+"</th>");
                ResultSet rs4 = null;
                rs4=manejador.executeQuery("SELECT SUM(calif), COUNT(calif)  FROM diagramas, diagramasP WHERE id_stdn="+idS+" AND id_dgp="+rs3.getString("diagramasP.id_dip")+" AND estado=0");
                rs4.next();
                total=rs4.getInt("SUM(calif)");
                cuenta=rs4.getInt("COUNT(calif)");
                if(cuenta==0){
                    cuenta=1;
                }
                res = total/cuenta;
                //out.println("<th>"+rs2.getString("diagramas.descripcion")+"</th>");
                out.println("<th>"+res+"</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");

        %>
    </center>    
    </body>
</html>
