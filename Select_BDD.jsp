<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Exemples de connexion à MariaDB et Exercices</title>
</head>
<body bgcolor="white">

<h1>Exemple de connexion à MariaDB avec JSP</h1>

<%
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "cnam";
    String password = "cnam";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT idFilm, titre, annee FROM Film";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            out.println("id : " + rs.getInt("idFilm") + ", titre : " + rs.getString("titre") + ", année : " + rs.getInt("annee") + "<br>");
        }
    } catch (Exception e) {
        out.println("Erreur : " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

<hr>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<p>Extraire les films dont l'année est supérieure à 2000 et inférieure à 2015.</p>

<%
    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee > 2000 AND annee < 2015";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            out.println("ID : " + rs.getInt("idFilm") + ", Titre : " + rs.getString("titre") + ", Année : " + rs.getInt("annee") + "<br>");
        }
    } catch (Exception e) {
        out.println("Erreur exercice 1 : " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

<hr>

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>

<form method="post">
    Année recherchée : <input type="text" name="anneeRecherche" />
    <input type="submit" value="Rechercher" />
</form>

<%
    String anneeRecherche = request.getParameter("anneeRecherche");

    if (anneeRecherche != null && !anneeRecherche.isEmpty()) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(anneeRecherche));
            rs = pstmt.executeQuery();

            out.println("<h3>Résultats pour l'année " + anneeRecherche + " :</h3>");
            while (rs.next()) {
                out.println("ID : " + rs.getInt("idFilm") + ", Titre : " + rs.getString("titre") + ", Année : " + rs.getInt("annee") + "<br>");
            }
        } catch (Exception e) {
            out.println("Erreur exercice 2 : " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
%>

<hr>

<h2>Exercice 3 : Modification du titre du film</h2>
<p>Créer un fichier permettant de modifier le titre d'un film à partir de son ID (ID choisi par l'utilisateur).</p>

<form method="post">
    ID du film à modifier : <input type="text" name="idFilmModif" /><br><br>
    Nouveau titre : <input type="text" name="nouveauTitre" /><br><br>
    <input type="submit" value="Modifier le titre" />
</form>

<%
    String idFilmModif = request.getParameter("idFilmModif");
    String nouveauTitre = request.getParameter("nouveauTitre");

    if (idFilmModif != null && nouveauTitre != null && !idFilmModif.isEmpty() && !nouveauTitre.isEmpty()) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "UPDATE Film SET titre = ? WHERE idFilm = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nouveauTitre);
            pstmt.setInt(2, Integer.parseInt(idFilmModif));

            int updated = pstmt.executeUpdate();
            if (updated > 0) {
                out.println("<p>Le titre du film a été modifié avec succès !</p>");
            } else {
                out.println("<p>Erreur : aucun film trouvé avec cet ID.</p>");
            }
        } catch (Exception e) {
            out.println("Erreur exercice 3 : " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
%>

<hr>

<h2>Exercice 4 : Insertion d'un nouveau film</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données.</p>

<form method="post">
    Titre du film : <input type="text" name="titreFilmAjout" /><br><br>
    Année du film : <input type="text" name="anneeFilmAjout" /><br><br>
    <input type="submit" value="Ajouter le film" />
</form>

<%
    String titreFilmAjout = request.getParameter("titreFilmAjout");
    String anneeFilmAjout = request.getParameter("anneeFilmAjout");

    if (titreFilmAjout != null && anneeFilmAjout != null && !titreFilmAjout.isEmpty() && !anneeFilmAjout.isEmpty()) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "INSERT INTO Film (titre, annee) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, titreFilmAjout);
            pstmt.setInt(2, Integer.parseInt(anneeFilmAjout));

            int inserted = pstmt.executeUpdate();
            if (inserted > 0) {
                out.println("<p>Le film a été ajouté avec succès !</p>");
            } else {
                out.println("<p>Erreur lors de l'ajout du film.</p>");
            }
        } catch (Exception e) {
            out.println("Erreur exercice 4 : " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
%>

<hr>

<h3>Projet Bibliothèque</h3>
<p>Votre projet consiste à concevoir et développer une application de gestion de bibliothèque moderne qui simplifie le processus de prêt et de retour de livres. Les fonctionnalités attendues dans le cadre de ce projet sont :</p>
<ul>
    <li>L’enregistrement et la suppression de livres.</li>
    <li>La recherche de livres disponibles.</li>
    <li>L'emprunt possible d'un livre par un utilisateur.</li>
    <li>La gestion des utilisateurs.</li>
    <li>La gestion des stocks.</li>
</ul>
<p>Votre application exploitera le langage JSP (Java) pour interagir avec la base de données MariaDB.</p>

<p>Elle pourra être enrichie avec des fonctionnalités supplémentaires comme des recommandations de livres, des notifications pour les retours en retard ou encore des statistiques sur l'utilisation des livres.</p>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
