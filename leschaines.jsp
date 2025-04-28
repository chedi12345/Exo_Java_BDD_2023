<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaînes</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaînes de caractères</h1>

<form action="#" method="post">
    <p>Saisir une chaîne (Du texte avec 6 caractères minimum) : 
    <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%
    String chaine = request.getParameter("chaine"); 
    if (chaine != null && !chaine.isEmpty()) { 
%>

    <%-- Calculs de base --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères.</p>

    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3ᵉ caractère de votre chaîne est la lettre : <%= caractereExtrait %></p>

    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous-chaîne extraite : <%= sousChaine %></p>

    <% 
        char recherche = 'e'; 
        int position = chaine.indexOf(recherche); 
    %>
    <p>Votre premier "e" est en position : <%= position %></p>

    <hr>

    <%-- Exercice 1 : Compter les 'e' --%>
    <%
        int compteurE = 0;
        for (int i = 0; i < chaine.length(); i++) {
            if (chaine.charAt(i) == 'e' || chaine.charAt(i) == 'E') {
                compteurE++;
            }
        }
    %>
    <p>Exercice 1 : Il y a <%= compteurE %> lettre(s) 'e' dans votre texte.</p>

    <hr>

    <%-- Exercice 2 : Affichage vertical --%>
    <p>Exercice 2 : Affichage vertical :</p>
    <p>
    <% 
        for (int i = 0; i < chaine.length(); i++) { 
    %>
        <%= chaine.charAt(i) %><br>
    <% 
        } 
    %>
    </p>

    <hr>

    <%-- Exercice 3 : Retour à la ligne après chaque espace --%>
    <p>Exercice 3 : Retour à la ligne sur les espaces :</p>
    <p>
    <% 
        String[] mots = chaine.split(" ");
        for (String mot : mots) { 
    %>
        <%= mot %><br>
    <% 
        } 
    %>
    </p>

    <hr>

    <%-- Exercice 4 : Une lettre sur deux --%>
    <p>Exercice 4 : Une lettre sur deux :</p>
    <p>
    <% 
        for (int i = 0; i < chaine.length(); i += 2) { 
            out.print(chaine.charAt(i));
        } 
    %>
    </p>

    <hr>

    <%-- Exercice 5 : Phrase inversée (verlant) --%>
    <p>Exercice 5 : Phrase en verlant :</p>
    <p>
    <% 
        for (int i = chaine.length() - 1; i >= 0; i--) { 
            out.print(chaine.charAt(i));
        } 
    %>
    </p>

    <hr>

    <%-- Exercice 6 : Compter voyelles et consonnes --%>
    <%
        int voyelles = 0;
        int consonnes = 0;
        String voyellesString = "aeiouyAEIOUY";
        for (int i = 0; i < chaine.length(); i++) {
            char c = chaine.charAt(i);
            if (Character.isLetter(c)) { 
                if (voyellesString.indexOf(c) != -1) {
                    voyelles++;
                } else {
                    consonnes++;
                }
            }
        }
    %>
    <p>Exercice 6 : Votre texte contient <%= voyelles %> voyelle(s) et <%= consonnes %> consonne(s).</p>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>

