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
                        <li><a href="#portfolio">MÁS LEIDOS</a></li>
                        <li><a href="#pricing">ULTIMOS CURSOS</a></li>
                        <li><a href="#contact">CONTÁCTO</a></li>
                            <%
                                String user = (String) session.getAttribute("username");
                                String acc = (String) session.getAttribute("acc");
                                if (user == null && acc == null) {
                                    out.println("<li><a href=\"login.jsp\">LOGIN</a></li>");
                                } else {
                                    out.println("<li><a href=\"indexnus.jsp\">" + user + "</a></li>");
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
                <input type="email" class="form-control" size="50" placeholder="Correo electronico" required>
                <button type="button" class="btn btn-danger">Solicitar información</button>
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

                    <br><button class="btn btn-default btn-lg" onclick="location.href = '#contact';">Ponerse en contacto</button>
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
            <h4>Los principales articulos del mes:</h4>
            <div class="row text-center slideanim">
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="imagenes/art1.jpg" alt="1" width="400" height="300">
                        <p><strong>LA influencia de la medicina Maya</strong></p>
                        <p>México es un cuenta con muy buenos medicos, pero eso no es algo nuevo....</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="imagenes/art2.jpg" alt="2" width="400" height="300">
                        <p><strong>10 datos interesantes sobre Tonantzin</strong></p>
                        <p>Lo que no te habian contado sobre la diosa madre de las culturas antiguas.</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="imagenes/art3.jpg" alt="3" width="400" height="300">
                        <p><strong>Bienvenidos a PAT</strong></p>
                        <p>LA plataforma de aprendizaje interactiva.</p>
                    </div>
                </div>
            </div><br>

            <h2>Articulos aleatorios:</h2>
            <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <h4>"Mitos y realidades sobre los sacrificios aztecas"<br><span style="font-style:normal;">Por: Andrés Zorraquin</span></h4>
                    </div>
                    <div class="item">
                        <h4>"Nuevo descubrimiento en Tenochtitlan"<br><span style="font-style:normal;">Por: Dillan Barbosa</span></h4>
                    </div>
                    <div class="item">
                        <h4>"Sobre la arquitectura Maya de Tulum"<br><span style="font-style:normal;">Por: Carlos Fuentes</span></h4>
                    </div>
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
            <div class="row slideanim">
                <div class="col-sm-4 col-xs-12">
                    <div class="panel panel-default text-center">
                        <div class="panel-heading">
                            <h1>Introducción a la civilización maya</h1>
                        </div>
                        <div class="panel-body">
                            <p><strong>1</strong> En este curso te introduciremos a la civilización maya mediante su historia, sus costumbres, religión, obras y hasta su estado actual. Todo de una manera simple, clara y concisa, ¡Esperamos que te guste!</p>
                        </div>
                        <div class="panel-footer plan">
                            <h3>30</h3>
                            <h4>Lugares disponibles</h4>
                            <button class="btn btn-lg">Inscribirse</button>
                        </div>
                    </div>      
                </div>    
            </div>
        </div>

        <!-- Container (Contact Section) -->
        <div id="contact" class="container-fluid bg-grey">
            <h2 class="text-center">CONTÁCTO</h2>
            <div class="row">
                <div class="col-sm-5">
                    <p>¿Te interesa saber más acerca de PAT? Llena el formulario de contacto.</p>
                    <p><span class="glyphicon glyphicon-map-marker"></span> México, DF</p>
                    <p><span class="glyphicon glyphicon-phone"></span> +52 5585647042</p>
                    <p><span class="glyphicon glyphicon-envelope"></span> info.at.pat@gmail.com</p>	   
                </div>
                <div class="col-sm-7 slideanim">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <input class="form-control" id="name" name="name" placeholder="Nombre" type="text" required>
                        </div>
                        <div class="col-sm-6 form-group">
                            <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
                        </div>
                    </div>
                    <textarea class="form-control" id="comments" name="comments" placeholder="Comentarios" rows="5"></textarea><br>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <button class="btn btn-default pull-right" type="submit">Enviar</button>
                        </div>
                    </div>	
                </div>
            </div>
        </div>



        <br>
        <br>
        <!-- SECCION LOGIN -->
        <div id="login" class="container-fluid">
            <div class="col-md-4 slideanim text-center col-md-offset-4 well">
                <s:form action="/Login" class="form-group">
                    <%
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
                            out.println("</h2>");
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


