<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>

<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" name="valeur2">
    <p>Saisir la valeur 3 (pour l'exercice 1) : <input type="text" name="valeur3">
    <p>Saisir un nombre (pour l'exercice 2) : <input type="text" name="nombre">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<%
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");
    String nombre = request.getParameter("nombre");

    if (valeur1 != null && valeur2 != null && !valeur1.isEmpty() && !valeur2.isEmpty()) {
        try {
            int intValeur1 = Integer.parseInt(valeur1);
            int intValeur2 = Integer.parseInt(valeur2);
%>
            <h2>Comparaison des deux premières valeurs :</h2>
            <% if (intValeur1 > intValeur2) { %>
                <p>Valeur 1 est supérieure à Valeur 2.</p>
            <% } else if (intValeur1 < intValeur2) { %>
                <p>Valeur 1 est inférieure à Valeur 2.</p>
            <% } else { %>
                <p>Valeur 1 est égale à Valeur 2.</p>
            <% } %>
<%
        } catch (NumberFormatException e) {
%>
            <p>Veuillez saisir des nombres valides pour Valeur 1 et Valeur 2.</p>
<%
        }
    }
%>

<hr>

<h2>Exercice 1 : C est-il compris entre A et B ?</h2>
<%
    if (valeur1 != null && valeur2 != null && valeur3 != null
        && !valeur1.isEmpty() && !valeur2.isEmpty() && !valeur3.isEmpty()) {
        try {
            int A = Integer.parseInt(valeur1);
            int B = Integer.parseInt(valeur2);
            int C = Integer.parseInt(valeur3);

            int min = Math.min(A, B);
            int max = Math.max(A, B);

            if (C >= min && C <= max) {
%>
                <p>Oui, C (=<%= C %>) est compris entre A (=<%= A %>) et B (=<%= B %>).</p>
<%
            } else {
%>
                <p>Non, C (=<%= C %>) n'est pas compris entre A (=<%= A %>) et B (=<%= B %>).</p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p>Veuillez saisir des nombres valides pour A, B et C.</p>
<%
        }
    }
%>

<hr>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<%
    if (nombre != null && !nombre.isEmpty()) {
        try {
            int n = Integer.parseInt(nombre);
            if (n % 2 == 0) {
%>
                <p>Le nombre <%= n %> est pair.</p>
<%
            } else {
%>
                <p>Le nombre <%= n %> est impair.</p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p>Veuillez saisir un nombre valide pour vérifier pair/impair.</p>
<%
        }
    }
%>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>

