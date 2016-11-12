<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
//            String user = (String)session.getAttribute("username");
//            String acc = (String)session.getAttribute("acc");
            session.setAttribute("username", null);
            session.setAttribute("acc", null);
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
