<%-- 
    Document   : mensajes.jsp
    Created on : 13 /11/2016, 8:54:00 PM
    Author     : Dillan
--%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String user = null;
    String uDestino = null;
    String acc = null;
    ResultSet userData = null;
    ResultSet mensajes = null;
    ResultSet uDestinoD = null;
    ResultSet users = null;
    String idUser = null;
    String idUserD = null;
    String uDestinoS = "Mensajes";
    String uDestinoSP = "Mensajes";
    int nivelAceeso = 0;
    try{
        user = (String) session.getAttribute("username");
        acc = (String) session.getAttribute("acc");
        if(acc==null || user==null){
            response.sendRedirect("errors.jsp?id=500");
        }
        //Obtenemos el id del usuario destino desde la sesion
        uDestinoSP = (String)session.getAttribute("usuDest");
        //Obtenemos el id del usuario destino desde los parametros
        uDestino = (String) request.getParameter("idFriend");
        System.out.println("acc = "+acc);
        //Si el parametro no es nulo...
        if(uDestino!=null){
            //Si el parametro y el atributo son distintos...
            if(uDestinoSP!=uDestino){
                System.out.println(uDestino +" "+ uDestinoSP);
                //Guardamos el valor del parametro lo guardamos en la sesion.
                session.setAttribute("usuDest", uDestino);
                //System.out.println(uDestino +" "+ uDestinoSP);
            }
        }else{
            //Si el parametro es nulo...
            //Si el valor del atributo no es nulo...
            if(uDestinoSP!=null){
                //Obtenemos el valor guardado en la sesion.
                uDestino = (String)session.getAttribute("usuDest");
            }
        }
    }catch(Exception e){
        System.out.println("No se pudo recuperar la sesion: username o acc");
        System.out.println(e);
    }
%>
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
                        <li><a href="mensajes.jsp">PAT</a></li>
                        <li>
                            <%
                                if(acc.equals("1")){
                                    out.println("<a href='indexnus.jsp'>Inicio</a>");
                                }
                                if(acc.equals("2")){
                                    out.println("<a href='indexalumn.jsp'>Inicio</a>");
                                }
                                if(acc.equals("3")){
                                    out.println("<a href='admin.jsp'>Inicio</a>");
                                }
                                if(acc.equals("4")){
                                    out.println("<a href='indexprofp.jsp'>Inicio</a>");
                                }
                                if(acc.equals("5")){
                                    out.println("<a href='indexprofesc.jsp'>Inicio</a>");
                                }
                            %>
                        </li>
                            <%
                                if (user == null && acc == null){
                                    out.println("<li><a href='indexnus.jsp'>LOGIN</a></li>");
                                } else {
                                    out.println("<li><a href='indexnus.jsp'>" + user + "</a></li>");
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
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            try {
                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                //*******[Obtenemos los usuarios que existen en la bd]***********
                users = manejador.executeQuery("SELECT * FROM users;");
                //*******[Para la consulta del usuario destino del mensaje]******
                if (uDestino != null) {
                    System.out.println(uDestino);
                    uDestinoD = manejador.executeQuery("SELECT * FROM users WHERE users.idUser='" + uDestino + "';");
                    uDestinoD.next();
                    uDestinoS = uDestinoD.getString("users.id");
                    idUserD = uDestinoD.getString("users.idUser");
                }
                //***************************************************************
                //************[Seleccionamos los id numericos de los usuarios]****************
                userData = manejador.executeQuery("SELECT idUser FROM users WHERE users.id='" + user + "';");
                userData.next();
                idUser = userData.getString("users.idUser");
                //***************************************************************
                //*******************[Obtenemos todos los mensajes, provenientes y dirigidos a otro usuario]*******************
                if (idUser != null) {
                    mensajes = manejador.executeQuery("SELECT mensajes.* FROM mensajes WHERE ( idUsuEnvia=" + idUserD + " AND idUsuRecibe=" + idUser + " )OR( idUsuEnvia=" + idUser + " AND idUsuRecibe=" + idUserD + " ) ORDER BY fecha DESC;");
                } else {
                    //*****[En el caso de que el id numerico del usuario actual no exista]*********************
                    System.out.println("No existe el usuario en la BD.");
                    response.sendRedirect("errors.jsp?id=500");
                }
                //***************************************************************
            } catch (Exception e) {
                response.sendRedirect("errors.jsp?id=500");
            }
        %>
        <div id="main" class="container-fluid">
            <div class="col col-sm-2">
                <div class="row row-xs-3 time">
                    Usuarios
                </div>
                <div class="row">
                    <!--<input type="text" name="busqueda" placeholder="Buscar usuario" class="form-control"/>-->
                </div>
                <div class="row">
                    <hr>
                    <ul>
                        <%
                            while (users.next()) {
                                if (!users.getString("users.id").toUpperCase().equals(user.toUpperCase())) {
                                    out.println("<li><a href='mensajes.jsp?idFriend=" + users.getString("users.idUser") + "'>" + users.getString("users.id") + "</a></li>");
                                }
                            }
                        %>
                    </ul>
                </div>
            </div><span class="col-sm-1"></span>
            <div class="col col-sm-8">
                <div class="row row-xs-3 titulo-seccion text-center">
                    <%
                        if (!user.toUpperCase().equals(uDestinoS.toUpperCase())) {
                            out.println(uDestinoS);
                        } else {
                            out.println("Mensajes");
                        }
                    %>
                </div>
                <s:form action="/EnviarM" id="mensajes" class="form-group">
                    <%
                        if (uDestino != null) {
                            out.println(
                                    "<div class='row'>"
                                    + "<input type='hidden' value=" + idUserD + " name='usuario'/>"
                                    + "<input type='hidden' value='Mensaje' name='titulo'/>"
                                    + "<input type='hidden' value=" + idUser + " name='idenvia'/>"
                                    + "<div class='col col-sm-9'>"
                                    + "<input type='text' class='form-control' name='texto'  form='mensajes' placeholder='Escribe aquí.'/>"
                                    + "</div>"
                                    + "<div class='col col-sm-2'>"
                                    + "<input type='submit' class='btn btn-default form-control' value='Enviar'/>"
                                    + "</div>"
                                    + "<div class='col col-sm-1'>"
                                    + "<a href='mensajes.jsp?idFriend="+uDestino+"' class='btn btn-default'><img src='resources/reload.png' width='20' height='20'/></a>"
                                    + "</div>"
                            );
                        }
                    %>
                </s:form>
                <hr>
                <div class="row  well">
                    <%
                        if (!user.toUpperCase().equals(uDestinoS.toUpperCase()) && uDestino != null) {
                            if (mensajes.next() == true) {
                                mensajes.previous();
                                try {
                                    while (mensajes.next()) {
                                        if (mensajes.getString("mensajes.idUsuEnvia").equals(idUser)) {
                                            out.println("<div class='row row-sm-3 btn-info center-block'>"
                                                    + "<div class='col-sm-2'><img src='resources/user.png' class='chat img-rounded'/></div>"
                                                    + "<div class='col-sm-10'>"
                                                    + "<div class='row msg-author'>" + user + "</div>"
                                                    + "<div class='row'>" + mensajes.getString("mensajes.Texto") + "</div>"
                                                    + "<div class='row time-chat pull-right'>" + mensajes.getString("mensajes.fecha") + "</div>"
                                                    + "</div></div>");
                                        } else {
                                            out.println("<div class='row row-sm-3 btn-default center-block'>"
                                                    + "<div class='col-sm-2'><img src='resources/user.png' class='chat img-rounded'/></div>"
                                                    + "<div class='col-sm-10'>"
                                                    + "<div class='row msg-author'>" + uDestinoS + "</div>"
                                                    + "<div class='row'>" + mensajes.getString("mensajes.Texto") + "</div>"
                                                    + "<div class='row time-chat pull-right'>" + mensajes.getString("mensajes.fecha") + "</div>"
                                                    + "</div></div>");
                                        }
                                    }
                                } catch (Exception e) {
                                    System.out.println(e);
                                }
                            } else {
                                out.print("<div class='text-center'>Sin Mensajes</div>");
                            }
                        } else {
                            out.println("<div class='text-center'><img src='resources/default_image.png'/></div>");
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
