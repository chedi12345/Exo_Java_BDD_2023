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
