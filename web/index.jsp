<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="es">
<head>
    <script>
        function loadDoc() { 
        
        var xhttp = new XMLHttpRequest();
        
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                alert("Adios ;)");
            }
        };
        
        xhttp.open("POST", "csesion.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id=0");
        setTimeout("location.href = 'index.jsp';", 1000);
    }
    </script>
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
      <a class="navbar-brand" href="#myPage">Logo</a>
      <!--<a class="navbar-brand" href="#myPage"><img src="logoSita.png" alt="Logo" width="50" height="80"></a>-->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">¿Que es PAT?</a></li>
        <li><a href="#portfolio">MÁS LEIDOS</a></li>
        <li><a href="#pricing">ULTIMOS CURSOS</a></li>
        <li><a href="#contact">CONTÁCTO</a></li>
        <%
            String user = (String)session.getAttribute("username");
            String acc = (String)session.getAttribute("acc");
            if(user==null&&acc==null){
                out.println("<li><a href=\"#login\">LOGIN</a></li>");
            }else{
                out.println("<li><a href=\"#login\">"+user+"</a></li>");
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
      <p><center>PAT permite inscribirse a cursos acerca de los temas presentados en la plataforma, tambien permite a los profesores escolares crear grupos para sus alumnos dentro de la plataforma y asignarles actividades a sus alumnos.
                    PAT busca llevar el conocimiento (en esta primera etapa sobre las zonas aqrqueologicas de nuestro pais) a una nueva generación de personas
                    de una manera interesante, entretenida e interactiva</center></p>
        
      <br><button class="btn btn-default btn-lg" onclick="location.href='#contact';">Ponerse en contacto</button>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe logo slideanim"></span>
    </div>
    <div class="col-sm-8">
      <h2>NUESTROS VALORES</h2><br>
      <p>Responsabilidad</p>
      <p>Compromiso</p>
      <p></p>
      <h4><strong>MISIÓN:</strong> Nuestra misión.</h4><br>
      <p><strong>VISIÓN:</strong> Nuestra vision.</p>
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
      <span class="glyphicon glyphicon-off logo-small"></span>
      <h4>PODER</h4>
      <p>Controle su información en todo momento y desde cualquier lugar.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart logo-small"></span>
      <h4>INTERACCIÓN</h4>
      <p>Acérquese a sus pacientes y mantenga un contacto permanente con ellos.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small"></span>
      <h4>CALIDAD</h4>
      <p>Realice sus operaciones con la confianza en la calidad y seguridad de nuestro sistema.</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-leaf logo-small"></span>
      <h4>ECO</h4>
      <p>Deshágase del papel y las agendas, ayudenos a salvar el planeta.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate logo-small"></span>
      <h4>CERTIFICADOS</h4>
      <p>Contamos con las certificaciones mas importantes y exigentes de la industria.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench logo-small"></span>
      <h4 style="color:#303030;">TRABAJO DURO</h4>
      <p>Nuestro equipo estará siempre disponible para ayudarlo, trabajamos día y noche para su beneficio.</p>
    </div>
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
          <h1>Los Mayas, su cultura y su influencia</h1>
        </div>
        <div class="panel-body">
          <p><strong>1</strong> Médico</p>
          <p><strong>500</strong> Pacientes</p>
          <p><strong>1</strong> Ubicación</p>
          <p><strong>1GB</strong> Almacenamiento</p>
          <p><strong>Ilimitadas</strong> Consultas</p>
        </div>
        <div class="panel-footer plan">
          <h3>12</h3>
          <h4>Lugares disponibles</h4>
          <button class="btn btn-lg">Inscribirse</button>
        </div>
      </div>      
    </div>     
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Premium</h1>
        </div>
        <div class="panel-body">
          <p><strong>5</strong> Médicos</p>
          <p><strong>2500</strong> Pacientes</p>
          <p><strong>1</strong> Ubicación</p>
          <p><strong>3GB</strong> Almacenamiento</p>
          <p><strong>Ilimitadas</strong> Consultas</p>
        </div>
        <div class="panel-footer plan">
          <h3>$109</h3>
          <h4>mensuales</h4>
          <button class="btn btn-lg">Pedir</button>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Total</h1>
        </div>
        <div class="panel-body">
          <p><strong>20</strong> Médicos</p>
          <p><strong>Ilimitados</strong> Pacientes</p>
          <p><strong>3</strong> Ubicación</p>
          <p><strong>Ilimitado</strong> Almacenamiento</p>
          <p><strong>Ilimitadas</strong> Consultas</p>
        </div>
        <div class="panel-footer plan">
          <h3>$169</h3>
          <h4>mensuales</h4>
          <button class="btn btn-lg">Pedir</button>
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
      <p>Póngase en contacto con nosotros y le responderemos en las próximas 24 horas.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> México, DF</p>
      <p><span class="glyphicon glyphicon-phone"></span> +52 5585647042</p>
      <p><span class="glyphicon glyphicon-envelope"></span> sita@nazeer.com</p>	   
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

<div id="googleMap" style="height:400px;width:100%;"></div>

<br>
<br>
<!-- SECCION LOGIN -->
<div id="login" class="container-fluid">
    
    <%
            if(user==null&&acc==null){
                out.println("<h2 class=\"text-center\">Inicio de Sesión</h2>");
            }else{
                out.println("<h2 class=\"text-center\">Cerrar Sesión</h2>");
                out.println("    <center>");
                out.println("<button type=\"button\" onclick=\"loadDoc();\" class=\"btn btn-danger\">Cerrar Sesión</button>");
                out.println("</h2>");
                out.println("    </center>");
            }
    %>
    
                <!--<h2 class="text-center"></h2>-->
            <div class="col-md-4 slideanim text-center col-md-offset-4 well">
                <s:form action="/Login" class="form-group">
                    <div class="row form-group">
                        <div class="row-xs-3 form-group">
                            <label for="usuario">Nombre de usuario: </label>
                            <input type="text" name="username" placeholder="Usuario" id="usuario" class="btn-block form-control"/>
                        </div>
                        <div class="row-xs-3 form-group">                        
                            <label for="contra">Contraseña: </label>
                            <input type="password"  name="password" placeholder="Contraseña" id="contra" class="btn-block form-control"/>
                        </div>
                        <div class="row-xs-3 form-group">
                            <br>
                            <input type="submit" class="btn btn-primary form-control btn-block" value="Acceder"/>
                        </div>
                        <div class="row-xs-3 form-group">
                            <br>
                            ¿No tiene cuenta en PAT?<br>
                            <a href="registro.jsp" class="btn btn-danger btn-block">Registrarse en la plataforma</a>
                        </div>
                    </div>
                </s:form>
            </div>
    </div>

<!-- Add Google Maps -->
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
var myCenter = new google.maps.LatLng(19.50419, -99.1487605);

function initialize() {
var mapProp = {
  center:myCenter,
  zoom:15,
  scrollwheel:false,
  draggable:false,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker = new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>PAT</p>		
</footer>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 900, function(){
   
      // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
    });
  });
  
  // Slide in elements on scroll
  $(window).scroll(function() {
    $(".slideanim").each(function(){
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
        

