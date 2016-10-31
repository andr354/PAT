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
      <a class="navbar-brand" href="index.jsp">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admin.jsp">INICIO</a></li>
        <li><a href="alumnos.jsp">Alumnos</a></li>
        <li><a href="profs.jsp">Profesores</a></li>
        <li><a href="profsp.jsp">Profesores+</a></li>
        <li><a href="oats.jsp">OATs</a></li>
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
    <div class="col-sm-8">
      <h2>Administración de Usuarios</h2><br>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
      <div>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            
        try{    
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            int acc2 = Integer.parseInt(acc);
        if(acc2==3){
                //out.println("Acceso autorizado<br>");
            
            String rol = "";
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");

            rs2=manejador.executeQuery("SELECT idUser, id, rol, nivel, email FROM users");//id_usu, nom_usu, acc_usu FROM usuarios
            
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Nombre</th>");
            out.println("<th>Email</th>");
            out.println("<th>Rol</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                String acceso = "Usuario Registrado";
                if(rs2.getInt("users.nivel")==2){
                    acceso = "Usuario alumno";
                }else if(rs2.getInt("users.nivel")==3){
                    acceso = "Administrador";
                }else if(rs2.getInt("users.nivel")==4){
                    acceso = "Profesor generador";
                }else if(rs2.getInt("users.nivel")==5){
                    acceso = "Profesor escolar";
                }
                out.println("<tr>");
                out.println("<th>"+rs2.getString("users.idUser")+"</th>");
                out.println("<th>"+rs2.getString("users.id")+"</th>");
                out.println("<th>"+rs2.getString("users.email")+"</th>");
                out.println("<th>"+acceso+"</th>");
                //out.println("<th>"+rs2.getString("usuarios.acc_usu")+"</th>");
                out.println("<th>");
                out.println(" <a href='modificar.jsp?id="+rs2.getString("users.idUser")+"'>Modificar usuario</a> |");
                out.println(" <a href='eliminar.jsp?id="+rs2.getString("users.idUser")+"'>Eliminar usuario</a> ");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
        }else{
            response.sendRedirect("index.jsp");
        }
        }catch(Exception e){
            //response.sendRedirect("index.jsp");
        }

        %>
      </div>
  </div>
      <h2>Agregar nuevo usuario</h2>
        <s:form action="/Add">
            <s:textfield placeHolder="Nombre de usuario" name="username" label="Username" required="true"/>
            <s:textfield placeHolder="Contraseña" name="password" label="Password" required="true"/><br>
             <s:select label="Rol" 
		headerKey="-1" headerValue="Asigne un rol al usuario"
		list="#{'1':'Usuario','2':'Estudiante', '3':'Administrador', '4':'Profesor generador', '5':'Profesor escolar'}" 
		name="rol" 
		value="rol"  required="true"/>
            Correo electronico:<input type="email" name="mail">
            <br>
            <br>
            <s:submit/>
        </s:form>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>PAT</p>		
</footer>
</body>
</html>