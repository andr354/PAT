<%-- 
    Document   : modificarProfEsc
    Created on : 29/10/2016, 12:57:40 PM
    Author     : Dillan
--%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <%
        int Id = 1;
        try{
            Id = Integer.parseInt(request.getParameter("id"));
        }catch(Exception e){
            out.print(e);
            response.sendRedirect("index.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/PATEstilos.css">
        <title>PAT</title>
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
                        <li><a href="admin.jsp">INICIO</a></li>
                        <li><a href="alumnos.jsp">Alumnos</a></li>
                        <li><a href="profs.jsp">Profesores</a></li>
                        <li><a href="profsp.jsp">Profesores+</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p>  
        </div>
        <!--Cuerpo de la pagina-->
        <div id="about" class="container-fluid">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <h2 class="text-center">Modificar perfil del profesor escolar</h2>
                    <%@ page import="java.sql.*" %>
                    <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                    <s:form action="/ModificarPE" class="form-horizontal">
                        <table class="table table-striped table-bordered table-responsive">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Escuela</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                try{
                                    //String user = (String)session.getAttribute("userName");
                                    ResultSet rs=null;
                                    manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
                                    rs=manejador.executeQuery("SELECT id_profe, id_usu, nom_prof, apps_prof, escuela FROM profesc WHERE id_profe='"+Id+"'");
                                    //while(rs.next()){
                                    rs.next();
                                    out.println("<input "
                                        + "type=\"hidden\""
                                        + "name=\"id\""
                                        + "value="+Id
                                        + " class=\"form-control\""
                                        + " />");
                                    out.println("<tr>");
                                    out.println("\t<th><input "
                                            + "type=\"text\" "
                                            + "name=\"nombre\" "
                                            + "class=\"form-control\""
                                            + "placeholder=\"" + rs.getString("profesc.nom_prof")
                                            + "\" value=\"" + rs.getString("profesc.nom_prof")
                                            + "\"/></th>");
                                    out.println("\t<th><input "
                                            + "type=\"text\" "
                                            + "name=\"apellidos\" "
                                            + "class=\"form-control\" "
                                            + "placeholder=\"" + rs.getString("profesc.apps_prof")
                                            + "\" value=\"" + rs.getString("profesc.apps_prof")
                                            +"\"/></th>");
                                    out.println("\t<th><input "
                                            + "type=\"text\" "
                                            + "name=\"escuela\" "
                                            + "class=\"form-control\" "
                                            + "placeholder=\"" + rs.getString("profesc.escuela")
                                            + "\" value=\"" + rs.getString("profesc.escuela")
                                            + "\"/></th>");
                                    out.println("</tr>");
                                    //}
                                } catch (Exception e) {
                                    out.print(e);
                                    response.sendRedirect("index.jsp");
                                }
                            %>
                            </tbody>
                        </table>
                        <input type="submit" value="Actualizar" class="btn btn-danger btn-xl col-sm-6"/>
                        <a href="profs.jsp" class="btn btn-primary btn-xl col-sm-6">Regresar</a>
                    </s:form>
                </div>
            </div>
        </div>
    </body>
</html>
