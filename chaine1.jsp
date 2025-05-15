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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(145deg, #f0f0f0, #d6d6d6);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            padding: 3rem 1rem;
            color: #333;
        }
        h2 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            animation: fadeSlideDown 1s ease;
        }
        form {
            background: #ffffff;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            animation: popUp 0.6s ease-in-out;
        }
        input[type="text"] {
            width: calc(100% - 2rem);
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border: 2px solid #ccc;
            border-radius: 0.75rem;
            margin-bottom: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            margin: 0.5rem;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border: none;
            border-radius: 0.75rem;
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: white;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }
        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }
        .message {
            margin-top: 1rem;
            font-weight: 600;
            font-size: 1rem;
            min-height: 1.5em;
            animation: fadeInOut 2.5s ease forwards;
        }
        .success { color: #2e7d32; }
        .error { color: #c62828; }
        ul {
            list-style: none;
            padding: 0;
            margin-top: 2rem;
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            justify-content: center;
            max-width: 600px;
        }
        ul li {
            background: #4CAF50;
            color: white;
            padding: 0.6rem 1.2rem;
            border-radius: 2rem;
            font-weight: bold;
            animation: scaleIn 0.4s ease;
        }

        @keyframes fadeSlideDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes popUp {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
        @keyframes fadeInOut {
            0% { opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { opacity: 0; }
        }
        @keyframes scaleIn {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
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
    <div class="message">
        <% switch(message) {
            case "add-success": out.print("<span class='success'>Valeur ajoutée avec succès !</span>"); break;
            case "add-full":    out.print("<span class='error'>Tableau plein, impossible d'ajouter !</span>"); break;
            case "add-error":   out.print("<span class='error'>Veuillez entrer un entier valide !</span>"); break;
            case "remove-success": out.print("<span class='success'>Dernière valeur supprimée !</span>"); break;
            case "remove-empty":   out.print("<span class='error'>Le tableau est déjà vide !</span>"); break;
            case "clear-success":  out.print("<span class='success'>Le tableau a été vidé !</span>"); break;
            default: break;
        } %>
    </div>
    <ul>
        <% for (Integer val : tableau) { %>
            <li><%= val %></li>
        <% } %>
    </ul>
</body>
</html>
