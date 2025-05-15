<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
    if (session.getAttribute("tableau") == null) {
        session.setAttribute("tableau", new ArrayList<Integer>());
    }

    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    String message = "";
    String action = request.getParameter("action");
    String valeur = request.getParameter("valeur");

    if ("ajouter".equals(action)) {
        try {
            if (tableau.size() < 10) {
                int val = Integer.parseInt(valeur);
                tableau.add(val);
                message = "add-success";
            } else {
                message = "add-full";
            }
        } catch (NumberFormatException e) {
            message = "add-error";
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "remove-success";
        } else {
            message = "remove-empty";
        }
    } else if ("vider".equals(action)) {
        tableau.clear();
        message = "clear-success";
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau Animé d'Entiers</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            margin: 0;
            padding: 2rem;
        }
        h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            animation: slideIn 0.8s ease-out;
        }
        form {
            background: #fff;
            padding: 1.5rem;
            border-radius: 1rem;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            animation: fadeIn 1s ease-in;
        }
        input[type="text"] {
            width: 150px;
            padding: 0.5rem;
            font-size: 1rem;
            border: 2px solid #ddd;
            border-radius: 0.5rem;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            margin: 0.5rem;
            padding: 0.6rem 1.2rem;
            font-size: 1rem;
            border: none;
            border-radius: 0.5rem;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(76,175,80,0.3);
            transition: transform 0.2s ease, background-color 0.3s ease;
        }
        button:hover {
            background-color: #43a047;
            transform: translateY(-2px);
        }
        .message {
            margin-top: 1rem;
            font-weight: bold;
            min-height: 1.5em;
            opacity: 0;
            animation: messageFade 1.4s ease forwards;
        }
        .message.success { color: #388E3C; }
        .message.error { color: #D32F2F; }
        ul {
            list-style: none;
            padding: 0;
            margin-top: 1.5rem;
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }
        ul li {
            background: #4CAF50;
            color: #fff;
            padding: 0.5rem 1rem;
            border-radius: 1rem;
            animation: popIn 0.5s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes popIn {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
        }
        @keyframes messageFade {
            0% { opacity: 0; }
            20% { opacity: 1; }
            80% { opacity: 1; }
            100% { opacity: 0; }
        }
    </style>
</head>
<body>
    <h2>Gestion Animée du Tableau</h2>
    <form method="post">
        <input type="text" name="valeur" placeholder="Entrer un entier" autocomplete="off">
        <br>
        <button type="submit" name="action" value="ajouter">Ajouter</button>
        <button type="submit" name="action" value="supprimer">Supprimer</button>
        <button type="submit" name="action" value="vider">Vider</button>
    </form>
    <div class="message ">
        <%-- Messages codés pour classer success ou error --%>
        <%
            switch(message) {
                case "add-success": out.print("<span class='success'>Valeur ajoutée avec succès !</span>"); break;
                case "add-full":    out.print("<span class='error'>Tableau plein, impossible d'ajouter !</span>"); break;
                case "add-error":   out.print("<span class='error'>Veuillez entrer un entier valide !</span>"); break;
                case "remove-success": out.print("<span class='success'>Dernière valeur supprimée !</span>"); break;
                case "remove-empty":   out.print("<span class='error'>Le tableau est déjà vide !</span>"); break;
                case "clear-success":  out.print("<span class='success'>Le tableau a été vidé !</span>"); break;
                default: break;
            }
        %>
    </div>
    <ul>
        <% for (Integer val : tableau) { %>
            <li><%= val %></li>
        <% } %>
    </ul>
</body>
</html>
