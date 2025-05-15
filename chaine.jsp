<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manipulation de chaîne</title>
</head>
<body>
<%
    String bonjour = "salut la compagnie";

    // Chaîne en majuscules
    String majuscules = bonjour.toUpperCase();

    // Première lettre en majuscule
    String capitalisee = "";
    if (bonjour != null && bonjour.length() > 0) {
        capitalisee = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1);
    }
%>

<h2>Chaîne originale : <%= bonjour %></h2>
<h2>En majuscules : <%= majuscules %></h2>
<h2>Première lettre en majuscule : <%= capitalisee %></h2>

</body>
</html>
