<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAT</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
        <script src="resources/busquedaTabla.js"></script>

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
                    <a class="navbar-brand" href="index.jsp">Logo</a>
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
        
         <div id="focused" class="container-fluid" >
            <div class="row">
                <div class="text-center">
                    <h2>Cursos en los que estas inscrito actualmente: </h2><br>
                </div>
            </div>
        </div>
                
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
        try{
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            int acc2 = Integer.parseInt(acc);
            if(acc.equals(null)){
                response.sendRedirect("index.jsp");
            }
            int idu = 1;
            ResultSet rs=null;
            ResultSet rs2 = null; 
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs=manejador.executeQuery("SELECT idUser FROM users WHERE users.id='"+user+"'"); 
                if(rs.next()){ 
                    idu = rs.getInt("users.idUser");
                }
            rs2=manejador.executeQuery("SELECT nombre, cursos.id_curso FROM cursos, inscritos  WHERE inscritos.id_usu="+idu+" and inscritos.id_curso=cursos.id_curso;"); 
                
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Curso</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("cursos.nombre")+"</th>");
                out.println("<th>");
                out.println("<a href='vercurso.jsp?id="+rs2.getString("cursos.id_curso")+"'>Ver curso</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            
            if(acc2==1){
                out.println("<br><br><br>");
                out.println("<h2>Realizar registro como usuario avanzado:</h2>");
                out.println("<a href='registrostd.jsp?id="+idu+"' class='btn btn-success btn-lg btn-block'>Alumno</a>");
                out.println("<br>");
                out.println("<a href='registroprf.jsp?id="+idu+"' class='btn btn-success btn-lg btn-block'>Profesor escolar</a>");
                
            }
         }catch (Exception e) {
                response.sendRedirect("index.jsp");
        }
        %>
                

        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>PAT</p>		
        </footer>
    </body>
</html>