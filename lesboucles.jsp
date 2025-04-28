<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Conversion de la valeur en entier --%>
<% int cpt = Integer.parseInt(valeur); %>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Voici le carré d'étoiles :</p>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= cpt; j++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>Voici le triangle rectangle gauche :</p>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= i; j++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>Voici le triangle rectangle inversé :</p>
<% for (int i = cpt; i >= 1; i--) { %>
    <p>
    <% for (int j = 1; j <= i; j++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Voici le triangle rectangle aligné sur la droite :</p>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= cpt - i; j++) { %>
        <%= "&nbsp;" %>
    <% } %>
    <% for (int k = 1; k <= i; k++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 5 : Triangle isocèle</h2>
<p>Voici le triangle isocèle :</p>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= cpt - i; j++) { %>
        <%= "&nbsp;" %>
    <% } %>
    <% for (int k = 1; k <= (2 * i - 1); k++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 6 : Le demi losange</h2>
<p>Voici le demi-losange :</p>
<%-- Partie croissante du losange --%>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= cpt - i; j++) { %>
        <%= "&nbsp;" %>
    <% } %>
    <% for (int k = 1; k <= i; k++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<%-- Partie décroissante du losange --%>
<% for (int i = cpt - 1; i >= 1; i--) { %>
    <p>
    <% for (int j = 1; j <= cpt - i; j++) { %>
        <%= "&nbsp;" %>
    <% } %>
    <% for (int k = 1; k <= i; k++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 7 : La table de multiplication</h2>
<p>Voici la table de multiplication :</p>
<% for (int i = 1; i <= 10; i++) { %>
    <p><%= cpt + " x " + i + " = " + (cpt * i) %></p>
<% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
