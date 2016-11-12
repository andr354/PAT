<%-- 
    Document   : errors
    Created on : 11/11/2016, 03:38:40 PM
    Author     : Dillan
--%>

<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
        String user = "Anonimo";
        try {
            user = (String) session.getAttribute("username");
        } catch (Exception e) {
            out.print(e);
            user = "Anonimo";
            response.sendRedirect("error");
        }
    %>
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
        <script src="resources/busquedaTabla.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" ng-app="pat">

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
                        <li><a href="admin.jsp">INICIO</a></li>
                        <li>
                            
                                <%
                                    if(user!=null)
                                        out.println("<a href='admin.jsp#focused'>"+user+"</a>");
                                %>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="about" class="container-fluid">
            <div class="row text-center">
                <h1 class="titulo-seccion">Error <%out.println(Id);%></h1>
                <img src="resources/sad.png" class="giant"/>
            </div>
        </div>
    </body>
</html>
