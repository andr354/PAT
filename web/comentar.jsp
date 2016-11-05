<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
        int Ide = Integer.parseInt(request.getParameter("ide"));
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
<title>Enviar participación</title>
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
                    <a class="navbar-brand" href="index.jsp">Logo</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="indexprofesc.jsp">INICIO</a></li> 
                    </ul>
                </div>
            </div>
        </nav>                 
        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p>  
        </div>
        
        
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
        <s:form action="/Com" class="form-horizontal form-control">
            <s:textfield placeHolder="Comentario" name="cmt" /><br>
            <input type="hidden" name="id" required="true" value=<%out.println(Id);%> />
            <input type="hidden" name="ide" required="true" value=<%out.println(Ide);%> />
            <br>
            <s:submit value="Guardar cambios" />
        </s:form>
            <!--Dice que no pero si jala chido-->
</body>
</html>
