<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
    %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAT</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="resources/busquedaTabla.js"></script>
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
                        <li><a href="indexprofesc.jsp">INICIO</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p>  

        </div>
    <div id="about" class="container-fluid text-center">

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
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs2=manejador.executeQuery("SELECT * FROM califs WHERE id_dig='"+Id+"' ");
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
                out.println("<th>"+rs2.getString("califs.id_dig")+"</th>");
                out.println("<th>"+rs2.getString("califs.descripcion")+"</th>");
                out.println("<th>"+rs2.getString("califs.calif")+"</th>");
                out.println("<th>"+rs2.getString("califs.notaP")+"</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
      %>
      <div class="col-sm-8 col-md-offset-2 text-center"> 
      <s:form action="/Cal" class="form-group">
            <table class="table table-striped table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <th>Anotaciones</th>
                                        <th>Calificacion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th><input type="text" name="nts" required class="form-control"/></th>
                                        <th><input type="number" name="calif" required class="form-control"/></th>
                                    </tr>
                                </tbody>
            </table>
            <input type="hidden" name="id" value=<%out.println(Id);%>/>
            <br>
            <s:submit value="Guardar cambios" />
        </s:form>
            <!--Dice que no pero si jala chido-->
      </div>
      </div>
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
