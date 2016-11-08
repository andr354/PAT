<%-- 
    Document   : registro
    Created on : 07-nov-2016, 21:46:33
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
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
            <h2 class="text-center">Registro en PAT:</h2>
            <div class="col-md-4 text-center col-md-offset-4 well">
                <s:form action="/Add" class="form-group">
                    <div class="row form-group">
                        <div class="row-xs-3 form-group">
                            <label for="usuario">Nombre de usuario: </label>
                            <input type="text" name="username" placeholder="Usuario" id="usuario" class="btn-block form-group" required/>
                        </div>
                        <div class="row-xs-3 form-group">                        
                            <label for="contra">Contraseña: </label>
                            <input type="password"  name="password" placeholder="Contraseña" id="contra" class="btn-block form-group" required/>
                        </div>
                        <div class="row-xs-3 form-group">                        
                            <label for="contra">Correo electronico: </label>
                            <input type="email"  name="mail" placeholder="Correo electronico" id="contra" class="btn-block form-group" required/>
                        </div>
                        <div class="row-xs-3 form-group">
                            <br>
                            <input type="submit" class="btn btn-primary form-group btn-block" value="Acceder"/>
                        </div>
                        <div class="row-xs-3 form-group">
                            <br>
                            ¿Ya tiene cuenta en PAT?<br>
                            <a href="login.jsp" class="btn btn-danger btn-block">Ingresar</a>
                        </div>
                    </div>
                </s:form>
            </div>
    </div>
    
                <!--<h2 class="text-center"></h2>-->
            <div class="col-md-4 slideanim text-center col-md-offset-4 well">
                <s:form action="/Login" class="form-group">
                    <div class="row form-group">
                        <!--<div class="col-sm-6 form-group">-->
                        <div class="row-xs-3 form-group">
                            <label for="usuario">Nombre de usuario: </label>
                            <input type="text" name="username" placeholder="Usuario" id="usuario" class="btn-block form-group"/>
                        </div>
                        <div class="row-xs-3 form-group">                        
                            <label for="contra">Contraseña: </label>
                            <input type="password"  name="password" placeholder="Contraseña" id="contra" class="btn-block form-group"/>
                        </div>
                        <!--</div>-->
                        <div class="row-xs-3 form-group">
                            <br>
                            <input type="submit" class="btn btn-primary form-group btn-block" value="Acceder"/>
                        </div>
                    </div>
                </s:form>
            </div>
    </body>
</html>
