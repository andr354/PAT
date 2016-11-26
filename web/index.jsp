<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
    <head>
        <script src="resources/verificar.js" type="text/javascript"></script>
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
                    <!--<a class="navbar-brand" href="#myPage"><img src="logoSita.png" alt="Logo" width="50" height="80"></a>-->
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#about">¿Que es PAT?</a></li>
                        <li><a href="#portfolio">Más leidos</a></li>
                        <li><a href="#pricing">Últimos cursos</a></li>
                            <%
                                try {
                                    String user = (String) session.getAttribute("username");
                                    String acc = (String) session.getAttribute("acc");
                                    if (user == null && acc == null) {
                                        out.println("<li><a href=\"#login\">LOGIN</a></li>");
                                    } else {
                                        out.println("<li><a href=\"indexnus.jsp\">" + user + "</a></li>");
                                    }
                                } catch (Exception e) {
                                }
                            %>
                        <!--<li><a href="#login">LOGIN</a></li>-->
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>PAT</h1> 
            <p>PLATAFORMA DE APRENDIZAJE TURISTICO</p> 
            <form class="form-inline">
                <!--<input type="email" class="form-control" size="50" placeholder="Correo electronico" required>
                <button type="button" class="btn btn-danger">Solicitar información</button>-->
            </form>
        </div>

        <!-- Container (About Section) -->
        <div id="about" class="container-fluid">
            <div class="row">
                <div class="col-sm-8">
                    <h2>Acerca de nuestra plataforma</h2><br>
                    <h4>PAT es una nueva manera de llevar el conocimiento a las personas, de una manera interactiva y entretanida.</h4><br>
                    <p><center>
                        PAT permite inscribirse a cursos acerca de los temas presentados en la plataforma, tambien permite a los profesores escolares crear grupos para sus alumnos dentro de la plataforma y asignarles actividades a sus alumnos.
                        PAT busca llevar el conocimiento (en esta primera etapa sobre las zonas aqrqueologicas de nuestro pais) a una nueva generación de personas
                        de una manera interesante, entretenida e interactiva
                    </center>

                    <br><button class="btn btn-default btn-lg" onclick="location.href = 'registro.jsp';">Registrarse</button>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-signal logo"></span>
                </div>
            </div>
        </div>

        <div class="container-fluid bg-grey">
            <div class="row">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-8">
                </div>
            </div>
        </div>-->

        <!-- Container (Services Section) -->
        <div id="services" class="container-fluid text-center">
            <h2>SERVICIOS</h2>
            <h4>Lo que ofrecemos</h4>
            <br>
            <div class="row slideanim">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-leaf logo-small"></span>
                    <h4>ECO</h4>
                    <p>El cambio del papel a lo digital nos ayuda a salvar el planeta</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-heart logo-small"></span>
                    <h4>INTERACCIÓN</h4>
                    <p>Interacción entre usuarios, profesores y alumnos, el conocimiento pertenece a todos.</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-lock logo-small"></span>
                    <h4>CALIDAD</h4>
                    <p>Ofrecemos una plataforma robusta y confiable que siempre este ahi para tí.</p>
                </div>
            </div>
            <br><br>
            <div class="row slideanim">
            </div>
        </div>

        <!-- Container (Portfolio Section) -->
        <div id="portfolio" class="container-fluid text-center bg-grey">
            <h2>MÁS LEIDOS</h2><br>
            <h4>Los principales artículos del mes:</h4>
            <div class="row text-center slideanim">
             <%@ page import="java.sql.*" %>
             <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
                <%

                    try {
                            int i = 0;
                            ResultSet rs = null;
                            ResultSet rs2 = null;
                            String email = null;
                            String[] imagen;
                            String img = "";
                            String imgP = "";
                            String styleImg = "";
                            manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                            rs2 = manejador.executeQuery("SELECT * FROM oats, profesores where oats.id_prof=profesores.id_usu;");
                            for(i=0;i<3;i++){
                                rs2.next();
                                out.println("<div class=\"col-sm-4\">");
                                out.println("<div class=\"thumbnail\">");
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
                                        img = "<img src=\"" + img + " \" alt=\"1\" width=\"400\" height=\"300\">";
                                        System.out.println(img);
                                    }else{
                                        img = "<img src=\"resources/default_image.png\" alt=\"1\" width=\"400\" height=\"300\">";
                                    }
                                } catch (Exception e) {
                                    if (img != "") {
                                        img = "<img src=\"" + img + "\" alt=\"1\" width=\"400\" height=\"300\">";
                                    }else{
                                        img = "<img src=\"resources/default_image.png\" alt=\"1\" width=\"400\" height=\"300\">";
                                    }
                                    System.out.println("----[No tiene estilo de imagen]----");
                                }
                                //out.println("<img src=\"imagenes/art1.jpg\" alt=\"1\" width=\"400\" height=\"300\">");
                                out.println("<a href=\"veroat.jsp?id="+rs2.getString("oats.id_oat")+"\">");
                                out.println(img + "</a>");
                                out.println("<p><strong>"+rs2.getString("oats.titulo")+"</strong></p>"); 
                                out.println("<p>"+rs2.getString("oats.descrip")+"</p>");
                                out.println("</div>");
                                out.println("</div>");
                            }
                    }catch(Exception e){
                        System.out.println(e);
                    }
                %>
            </div><br>

            <h2>Artículos aleatorios:</h2>
            <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <!--Items-->
                    <%
                        try {
                                int i = 0;
                                ResultSet rs = null;
                                manejador.setConnection("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/pat");
                                rs = manejador.executeQuery("SELECT * FROM oats, profesores WHERE oats.id_prof=profesores.id_usu and RAND()<(SELECT ((3/COUNT(*))*10) FROM oats) ORDER BY RAND() LIMIT 3;");
                                rs.next();
                                out.println(""
                                            + "<div class=\"item active\">"
                                            + "<h4>"+rs.getString("oats.titulo")+"<br><span style=\"font-style:normal;\">"
                                            + "Por: "+rs.getString("profesores.nom_prof") + " " + rs.getString("profesores.apps_prof")+""
                                            + "<br><button type=\"button\" class=\"btn btn-success\" onclick=\"location.href = 'veroat.jsp?id="+rs.getString("oats.id_oat")+"';\">Ver</button>"
                                            + "</span></h4></div>"
                                    );
                                for(i=0;i<2;i++){
                                    rs.next();
                                    out.println(""
                                            + "<div class=\"item\">"
                                            + "<h4>"+rs.getString("oats.titulo")+"<br><span style=\"font-style:normal;\">"
                                            + "Por: "+rs.getString("profesores.nom_prof") + " " + rs.getString("profesores.apps_prof")+""
                                            + "<br><button type=\"button\" class=\"btn btn-success\" onclick=\"location.href = 'veroat.jsp?id="+rs.getString("oats.id_oat")+"';\">Ver</button>"
                                            + "</span></h4></div>"
                                    );
                                }
                        }catch(Exception e){
                            System.out.println(e);
                        }
                    %>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Anterior</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Siguiente</span>
                </a>
            </div>
        </div>

        <!-- Container (Pricing Section) -->
        <div id="pricing" class="container-fluid">
            <div class="text-center">
                <h2>Cursos principales</h2>
                <h4>Los cursos principales de la plataforma.</h4>
            </div>
            
            <!--Cursos-->
            <%
                        try {
                                String user = (String) session.getAttribute("username");
                                String acc = (String) session.getAttribute("acc");
                                int i = 0;
                                int iduser = 0;
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                ResultSet rs3 = null;
                                try {
                                    rs2 = manejador.executeQuery("select idUser from users where id='" + user + "';");
                                    rs2.next();
                                    iduser = rs2.getInt("users.idUser");
                                } catch (Exception ex) {
                                    System.out.println(ex);
                                }
                                rs = manejador.executeQuery("SELECT * FROM cursos;");
                                for(i=0;i<3;i++){
                                    rs.next();
                                    if(rs.next()){
                                        rs3 = manejador.executeQuery("select count(id) from inscritos where id_curso="+rs.getInt("cursos.id_curso")+";");
                                        rs3.next();
                                    out.println("<div class=\"row slideanim\">"
                                            + "<div class=\"col-sm-4 col-xs-12\">"
                                            + "<div class=\"panel panel-default text-center\">"
                                            + "<div class=\"panel-heading\">"
                                            + "<h1>"+rs.getString("cursos.Nombre")+"</h1></div>"
                                            + "<div class=\"panel-body\">"
                                            + "<p><strong></strong>"+rs.getString("cursos.Descripcion")+"</p></div>"
                                            + "<div class=\"panel-footer plan\"><h3>"+(30-rs3.getInt("count(id)"))+"</h3>"
                                            + "<h4>Lugares disponibles</h4>"
                                    );
                                    if (user == null && acc == null) {
                                        out.println("<a href=\"login.jsp\" class=\"btn btn-warning btn-lg\">Ingrese para inscribirse al curso</a>");
                                    } else {
                                        out.println(" <a href='inscribirse.jsp?idc=" + rs.getString("cursos.id_curso") + "&idu=" + iduser + "'class=\"btn btn-success btn-lg\">inscribirse</a>");
                                    }

                                    //out.println("<button class=\"btn btn-lg\">Inscribirse</button>");
                                    out.println( "</div></div></div>"
                                            + "</div>"
                                    );
                                    }else{
                                        //Nada
                                    }
                                }
                        }catch(Exception e){
                            System.out.println(e);
                        }
                    %>
                         
        </div>

        <!-- SECCION LOGIN -->
        <div id="login" class="container-fluid">
            <div class="col-md-4 slideanim text-center col-md-offset-4 well">
                <s:form action="/Login" class="form-group">
                    <%
                        String user = (String) session.getAttribute("username");
                        String acc = (String) session.getAttribute("acc");
                        if (user == null && acc == null) {
                            out.println("<h2 class=\"text-center\">Inicio de Sesión</h2>"
                                    + "<div class='row form-group'>"
                                    + "<div class='row-xs-3 form-group'>"
                                    + "<label for='usuario'>Nombre de usuario: </label>"
                                    + "<input type='text' name='username' placeholder='Usuario' id='usuario' class='btn-block form-control'/>"
                                    + "</div><div class='row-xs-3 form-group'>"
                                    + "<label for='contra'>Contraseña: </label>"
                                    + "<input type='password'  name='password' placeholder='Contraseña' id='contra' class='btn-block form-control'/>"
                                    + "</div><div class='row-xs-3 form-group'>"
                                    + "<br><input type='submit' class='btn btn-primary form-control btn-block' value='Acceder'/>"
                                    + "</div><div class='row-xs-3 form-group'>"
                                    + "<hr><b>¿No tiene cuenta en PAT?</b><br>"
                                    + "<a href='registro.jsp' class='btn btn-danger btn-block'>Registrarse en la plataforma</a>"
                                    + "</div></div>");
                        } else {
                            out.println("<h2 class=\"text-center\">Cerrar Sesión</h2>");
                            out.println("<center>");
                            out.println("<button type=\"button\" onclick=\"loadDoc();\" class=\"btn btn-danger\">Cerrar Sesión</button>");
                            out.println("</center>");
                        }
                    %>
                </s:form>
            </div>
        </div>



        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>PAT</p>		
        </footer>

        <script>
            $(document).ready(function () {
                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar a, footer a[href='#myPage']").on('click', function (event) {

                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function () {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                });

                // Slide in elements on scroll
                $(window).scroll(function () {
                    $(".slideanim").each(function () {
                        var pos = $(this).offset().top;

                        var winTop = $(window).scrollTop();
                        if (pos < winTop + 600) {
                            $(this).addClass("slide");
                        }
                    });
                });
            })
        </script>

    </body>
</html>


