/*
 *  Creado por Andres zorraquin.
 */
function loadDoc() {

    var xhttp = new XMLHttpRequest();
    //Para cerrar sesión
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            //alert("Cerrando sesión.");
            console.log("Sesión cerrada");
        }
    };

    xhttp.open("POST", "csesion.jsp", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("id=0");
    setTimeout("location.href = 'index.jsp';", 1000);
}