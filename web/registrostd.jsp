<%-- 
    Document   : registrostd
    Created on : 11-nov-2016, 20:58:23
    Author     : Andres Z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<%
    int Id = Integer.parseInt(request.getParameter("id"));
%>
<html>
    <head>
        <title>Registro PAT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
        <style type="text/css">
            body{
                background:#6c132b;
            }
            h2{
                color: white;
            }
        </style>
    </head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

        <div id="login" class="container-fluid"> 
            <h2 class="text-center">Registro como Alumno en PAT:</h2>
            <div class="col-md-4 text-center col-md-offset-4 well">
                <s:form action="/AddAlumno" class="form-group">
                    <div class="row">
                        <input type="hidden" name="idu" id="idu" value=<%out.println(Id);%>/>
                        <div class="row-xs-3">
                            <label for="usuario">Nombre(s): </label>
                            <input type="text" name="nombre" placeholder="Nombre(s)" id="nombre" class="btn-block form-control" required/>
                        </div>
                        <div class="row-xs-3">                        
                            <label for="contra">Apellido(s): </label>
                            <input type="text"  name="apps" placeholder="Apellido(s)" id="apps" class="btn-block form-control" required/>
                        </div>
                        <div class="row-xs-3">                        
                            <label for="contra">Profesor: </label>
                            <input type="number"  name="idp" placeholder="ID de profesor" id="contra" class="btn-block form-control" required/>
                        </div>
                        <div class="row-xs-3">
                            <hr>
                            <input type="submit" class="btn btn-primary form-control btn-block" value="Registrarse"/><br>
                            <a href="indexnus.jsp" class="btn btn-info form-control">Volver</a>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
    </body>
</html>

