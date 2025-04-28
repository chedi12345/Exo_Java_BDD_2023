<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>

<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres séparés par des espaces (exemple : 6 78 15) :
    <input type="text" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%
    String chaine = request.getParameter("chaine");

    if (chaine != null && !chaine.trim().isEmpty()) {
        String[] tableauDeChiffres = chaine.trim().split("\\s+");

        int[] chiffres = new int[tableauDeChiffres.length];
        for (int i = 0; i < tableauDeChiffres.length; i++) {
            try {
                chiffres[i] = Integer.parseInt(tableauDeChiffres[i]);
            } catch (NumberFormatException e) {
                chiffres[i] = 0; // En cas d'erreur de saisie, mettre 0
            }
        }
%>

    <p>Le tableau contient <%= chiffres.length %> valeur(s).</p>

    <p>
    <% for (int i = 0; i < chiffres.length; i++) { %>
        Chiffre <%= (i + 1) %> : <%= chiffres[i] %><br>
    <% } %>
    </p>

<hr>

<h2>Exercice 1 : Le carré de la première valeur</h2>
<%
    if (chiffres.length > 0) {
        int carre = chiffres[0] * chiffres[0];
%>
        <p>Le carré de <%= chiffres[0] %> est : <%= carre %></p>
<%
    }
%>

<hr>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<%
    if (chiffres.length >= 2) {
        int somme2 = chiffres[0] + chiffres[1];
%>
        <p>La somme de <%= chiffres[0] %> et <%= chiffres[1] %> est : <%= somme2 %></p>
<%
    }
%>

<hr>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<%
    int sommeTotale = 0;
    for (int valeur : chiffres) {
        sommeTotale += valeur;
    }
%>
<p>La somme de toutes les valeurs est : <%= sommeTotale %></p>

<hr>

<h2>Exercice 4 : La valeur maximum</h2>
<%
    int max = chiffres[0];
    for (int valeur : chiffres) {
        if (valeur > max) {
            max = valeur;
        }
    }
%>
<p>La valeur maximale est : <%= max %></p>

<hr>

<h2>Exercice 5 : La valeur minimale</h2>
<%
    int min = chiffres[0];
    for (int valeur : chiffres) {
        if (valeur < min) {
            min = valeur;
        }
    }
%>
<p>La valeur minimale est : <%= min %></p>

<hr>

<h2>Exercice 6 : La valeur la plus proche de 0</h2>
<%
    int procheZero = chiffres[0];
    for (int valeur : chiffres) {
        if (Math.abs(valeur) < Math.abs(procheZero)) {
            procheZero = valeur;
        }
    }
%>
<p>La valeur la plus proche de 0 est : <%= procheZero %></p>

<hr>

<h2>Exercice 7 : La valeur la plus proche de 0 (version 2)</h2>
<%
    int procheZero2 = chiffres[0];
    for (int valeur : chiffres) {
        if (Math.abs(valeur) < Math.abs(procheZero2)) {
            procheZero2 = valeur;
        } else if (Math.abs(valeur) == Math.abs(procheZero2)) {
            if (valeur > procheZero2) {
                procheZero2 = valeur; // Priorité au positif
            }
        }
    }
%>
<p>La valeur la plus proche de 0 (version 2) est : <%= procheZero2 %></p>

<%
    } // fin du if (chaine != null)
%>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
