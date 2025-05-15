<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
    // Initialisation du tableau s'il n'existe pas encore
    if (session.getAttribute("tableau") == null) {
        session.setAttribute("tableau", new ArrayList<Integer>());
    }

    // Récupération du tableau
    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    String message = "";

    // Gestion des actions
    String action = request.getParameter("action");
    String valeur = request.getParameter("valeur");

    if ("ajouter".equals(action)) {
        if (tableau.size() < 10) {
            tableau.add(Integer.parseInt(valeur));
            message = "Valeur ajoutée avec succès.";
        } else {
            message = "Tableau plein, impossible d'ajouter.";
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "Dernière valeur supprimée.";
        } else {
            message = "Le tableau est déjà vide.";
        }
    } else if ("afficher".equals(action)) {
        message = "Contenu actuel du tableau : " + tableau.toString();
    } else if ("vider".equals(action)) {
        tableau.clear();
        message = "Le tableau a été vidé.";
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau d'entiers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            margin-top: 50px;
        }
        input[type="text"] {
            width: 100px;
            height: 30px;
            margin-bottom: 10px;
        }
        button {
            width: 150px;
            height: 40px;
            margin: 5px;
            border: none;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .message {
            margin-top: 20px;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
    <h2>Gestion du Tableau d'Entiers</h2>
    <form method="post">
        <input type="text" name="valeur" placeholder="Valeur entière">
        <br>
        <button type="submit" name="action" value="ajouter">Ajouter</button>
        <button type="submit" name="action" value="supprimer">Supprimer</button>
        <button type="submit" name="action" value="afficher">Afficher</button>
        <button type="submit" name="action" value="vider">Vider</button>
    </form>

    <div class="message">
        <%= message %>
    </div>
</body>
</html>
