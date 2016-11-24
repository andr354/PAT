<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <head>
        <!-- Theme Made By www.w3schools.com - No Copyright -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAT</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!--<script src="ckeditor/ckeditor.js"></script>-->
        <script src="//cdn.ckeditor.com/4.5.1/full-all/ckeditor.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            ResultSet rs2 = null;
            try {
                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                rs2 = manejador.executeQuery("SELECT * FROM oats, profesores where oats.id_prof=profesores.id_usu;");
            } catch (Exception e) {
                response.sendRedirect("index.jsp");
            }
        %>
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
                        <li><a href="index.jsp">INICIO</a></li>
                            <%                                try {
                                    String user = (String) session.getAttribute("username");
                                    String acc = (String) session.getAttribute("acc");
                                    if (user == null && acc == null) {
                                        out.println("<li><a href=\"login.jsp\">LOGIN</a></li>");
                                    } else {
                                        out.println("<li><a href=\"indexnus.jsp\">" + user + "</a></li>");
                                    }
                                } catch (Exception e) {
                                }
                            %>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 

        </div>

        <!-- Container (About Section) -->
        <div id="about" class="container-fluid">
            <div class="row">
                <div>
                    <h2 class="titulo-seccion">Articulos recientes</h2><br><hr>
                </div>
                <div>
                    <%
                        String divRow = "<div class=\"row\">";
                        String divCol2 = "<div class=\"col-sm-2 col-md-offset-3 text-center\">";
                        String divCol3 = "<div class=\"col-md-5\" well>";
                        String divClose = "</div>";
                        String[] imagen;
                        String img = "";
                        String imgP = "";
                        String styleImg = "";
                        while (rs2.next()) {
                            try {
                                imagen = rs2.getString("diagrama").split("<img ");
                                imgP = imagen[1].split("src=\"")[1];
                                img = imgP.split("\"")[0];
                            } catch (Exception e) {
                                img = "";
                                System.out.println("----[No tiene imagen]----");
                            }
                            try {
                                if(img!=""){
                                    styleImg = imgP.split("style=\"")[1];
                                    //styleImg = styleImg.split("\"")[0];
                                    //img = img + "\" style=\"" + styleImg + "\"";
                                    img = "<img src=\"" + img + " \" class=\"giant img-rounded\">";
                                    System.out.println(img);
                                }else{
                                    img = "<img src=\"resources/default_image.png\" class=\"giant img-rounded\">";
                                }
                            } catch (Exception e) {
                                if (img != "") {
                                    img = "<img src=\"" + img + "\" class=\"giant img-rounded\">";
                                }else{
                                    img = "<img src=\"resources/default_image.png\" class=\"giant img-rounded\">";
                                }
                                System.out.println("----[No tiene estilo de imagen]----");
                            }
                            out.println(
                                    divRow
                                    + divCol2
                                    + "<a href='veroat.jsp?id=" + rs2.getString("oats.id_oat") + "' class=\"link-titulo\">"
                                    + img + "</a>"
                                    + divClose
                                    + divCol3
                                    + "<a href='veroat.jsp?id=" + rs2.getString("oats.id_oat") + "' class=\"link-titulo\">"
                                    + rs2.getString("oats.titulo")
                                    //+ rs2.getString("oats.descrip")
                                    + "</a>"
                                    + "<div class=\"descripcion\">" + rs2.getString("oats.descrip") + "</div>"
                                    + "<b class=\"margin\">Por:</b> <b class=\"by-author\">" + rs2.getString("profesores.nom_prof") + " " + rs2.getString("profesores.apps_prof") + "</b>"
                                    + divClose
                                    + divClose
                                    + "<hr>");
                        }
                    %>
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
