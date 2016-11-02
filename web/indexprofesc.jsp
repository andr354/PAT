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
  <script src="//cdn.ckeditor.com/4.5.1/full-all/ckeditor.js"></script>
  
   <%
        int grupo = 0;
        try{
            grupo = Integer.parseInt(request.getParameter("grupo"));
        }catch(Exception e){
        }
    %>
  
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

    <script>
function capturar()
    {
        var porId = document.getElementById("nombre").value;
        //document.getElementById("resultado").innerHTML=" <br>Por ID: "+porId+" ";
        var pagina = "indexprofesc.jsp?grupo=";
        var paginaF = pagina.concat(porId);
        location.href = paginaF;
        
    }
    
    function crear()
    {
        var porId = document.getElementById("grupo").value;
        var porId2 = document.getElementById("prof").value;
        var porId3 = document.getElementById("desc").value;
        //document.getElementById("resultado").innerHTML=" <br>Por ID: "+porId+" ";
        var pagina = "ejemplo1.jsp?grupo=";
        var paginaF = pagina.concat(porId);
        var paginaF2 = paginaF.concat("&prof=");
        var paginaF3 = paginaF2.concat(porId2);
        var paginaF4 = paginaF3.concat("&desc=");
        var paginaF5 = paginaF4.concat(porId3);
        location.href = paginaF5;
        
    }
    
    function csesion(){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                //document.getElementById(""+snd+"").innerHTML = eestd;
            }
        };
        xhttp.open("POST", "csesion.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("user=x");
        location.href = "index.jsp";
    }
    
    function loadDoc(snd, std) {
        //alert("Cambiando: "+snd+" estado: "+std);
        var xhttp = new XMLHttpRequest();
        var est=0;
        if(std==0){
            est=1;
        }
        var eestd = document.getElementById(""+snd+"").innerHTML;
        if(eestd==0){
            eestd=1;
        }else{
            eestd=0;
        }
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                document.getElementById(""+snd+"").innerHTML = eestd;
            }
        };
        xhttp.open("POST", "cestado.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id="+snd+"&std="+est);
        //location.href = "professorIndex.jsp?grupo=0";
    }
    </script>    

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
        <li><a href="mensajes.jsp">MENSAJES</a></li>
        <%
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            if(Integer.parseInt(acc)!=5){
                response.sendRedirect("index.jsp");
            }
            if(user==null&&acc==null){
                out.println("<li><a href=\"#login\">LOGIN</a></li>");
            }else{
                out.println("<li><a href=\"indexnus.jsp\">"+user+"</a></li>");
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
    <div class="col-sm-8">
    </div>
    <div class="col-sm-4">
    </div>
      <div>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            //String user = (String)session.getAttribute("username");
            String rol = "";
            int idP = 1;
            int idPr = 1;
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            ResultSet rs3 = null;
            ResultSet rss = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/pat");
            rs=manejador.executeQuery("SELECT rol, nivel, idUser FROM users WHERE users.id='"+user+"'"); //"+user+"
            if(grupo==0){
                rs2=manejador.executeQuery("SELECT * FROM users, students WHERE nivel=2 and idUser=id_usu ");
            }else{
                rs2=manejador.executeQuery("SELECT * FROM users, students WHERE nivel=2 and idUser=id_usu and grp_std='"+grupo+"' ");
            }
            if(rs.next())
                rol = rs.getString("Users.rol");
                nivel = rs.getInt("Users.nivel");
                idP = rs.getInt("Users.idUser");
                System.out.println(idP);
                rss=manejador.executeQuery("SELECT id_profe FROM profesc WHERE id_usu="+idP+"");
                if(rss.next()){
                    idPr = rss.getInt("profesc.id_profe");
                }

            rs3=manejador.executeQuery("SELECT * FROM oats WHERE id_prof='"+idP+"' ");
            //manejador.closeConnection();
            //out.println("<h1>Bienvenido "+rol+" : "+user+"</h1>");
            System.out.println("-"+rol+"-");
            out.println("<br><br>");
            out.println("<h2>Alumnos activos actualmente:</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            out.println("<th>Grupo</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("students.nom_std")+" "+rs2.getString("students.app_std")+"</th>");
                out.println("<th>"+rs2.getString("students.grp_std")+"</th>");
                out.println("<th><a href='diagramas.jsp?id="+rs2.getString("students.id_std")+"&idu="+rs2.getString("users.idUser")+"&idp="+idP+"'>Ver participaciones</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            out.println("Ver solo el grupo: ");
            out.println("<form id=\"form1\">");
            out.println("<br><input type=\"number\" id=\"nombre\" class=\"formulario\">");
            out.println("</form>");
            out.println("<input type=\"button\" value=\"Filtrar\" onclick=\"capturar()\">");
            out.println("<div id=\"resultado\"></div>");
            
            out.println("<br><br>");
            out.println("<h2>OATs creados:</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Descripción</th>");
            out.println("<th>Grupo</th>");
            out.println("<th>Estado</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs3.next()){
                out.println("<tr>");
                out.println("<th>"+rs3.getInt("oats.id_oat")+"</th>");
                out.println("<th>"+rs3.getString("oats.descrip")+"</th>");
                out.println("<th>"+rs3.getInt("oats.grupo")+"</th>");
                out.println("<th id=\""+rs3.getInt("oats.id_oat")+"\">"+rs3.getInt("oats.estado")+"</th>");
                out.println("<th>");
                out.println("<button type=\"button\" onclick=\"loadDoc("+rs3.getInt("oats.id_oat")+","+rs3.getInt("oats.estado")+")\">Cambiar estado</button>");
                out.println("<a href='eliminarD.jsp?id="+rs3.getInt("oats.id_oat")+"'>Eliminar | </a>");
                out.println("<a href='veroat2.jsp?id="+rs3.getInt("oats.id_oat")+"'>Ver</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");

        %>
      </div>
  </div>
      <h2>Agregar nuevo OAT</h2>
      <s:form action="/AddOAT" id="usrform">
            ID de generador: <br><input type="number" name="id"/><br>
            Titulo: <br><input type ="text" name="titulo"/><br>
            Descripción: <br><input type="text" name = "desc"/><br>
            Curso al que pertenece el OAT: <br><input type="number" name = "curso"/><br>
            <br><textarea name="contenido" form="usrform" id="contenido" rows="20" cols="80"></textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'contenido' );
            </script>
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
