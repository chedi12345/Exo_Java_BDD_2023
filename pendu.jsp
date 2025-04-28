<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random, java.util.ArrayList, java.util.Arrays" %>

<!DOCTYPE html>
<html>
<head>
    <title>Jeu du Pendu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .game-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .word-display {
            font-size: 24px;
            letter-spacing: 5px;
            margin: 20px 0;
        }
        .hangman {
            white-space: pre;
            font-family: monospace;
            margin: 20px 0;
        }
        .letter-input {
            font-size: 20px;
            width: 50px;
            text-align: center;
            text-transform: uppercase;
        }
        .message {
            font-weight: bold;
            margin: 10px 0;
            min-height: 24px;
        }
        .guessed-letters {
            margin: 10px 0;
        }
        .restart-btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .restart-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="game-container">
        <h1>Jeu du Pendu</h1>
        
        <%
        // Initialisation des variables de jeu
        String[] mots = {"JAVA", "JSP", "SERVLET", "TOMCAT", "HTML", "CSS", "JAVASCRIPT", "MYSQL", "ECLIPSE", "GITHUB"};
        String motSecret = (String) session.getAttribute("motSecret");
        char[] motMasque = (char[]) session.getAttribute("motMasque");
        Integer essaisRestants = (Integer) session.getAttribute("essaisRestants");
        ArrayList<Character> lettresProposees = (ArrayList<Character>) session.getAttribute("lettresProposees");
        String message = "";
        boolean partieTerminee = false;
        
        // Initialiser une nouvelle partie si nécessaire
        if (motSecret == null || "true".equals(request.getParameter("nouvellePartie"))) {
            motSecret = mots[new Random().nextInt(mots.length)];
            motMasque = new char[motSecret.length()];
            Arrays.fill(motMasque, '_');
            essaisRestants = 6;
            lettresProposees = new ArrayList<Character>();
            
            session.setAttribute("motSecret", motSecret);
            session.setAttribute("motMasque", motMasque);
            session.setAttribute("essaisRestants", essaisRestants);
            session.setAttribute("lettresProposees", lettresProposees);
        }
        
        // Traitement d'une proposition de lettre
        if (request.getParameter("lettre") != null && !partieTerminee) {
            String lettreParam = request.getParameter("lettre").toUpperCase();
            if (lettreParam.length() == 1) {
                char lettre = lettreParam.charAt(0);
                
                if (lettresProposees.contains(lettre)) {
                    message = "Vous avez déjà proposé cette lettre !";
                } else {
                    lettresProposees.add(lettre);
                    boolean lettreTrouvee = false;
                    
                    for (int i = 0; i < motSecret.length(); i++) {
                        if (motSecret.charAt(i) == lettre) {
                            motMasque[i] = lettre;
                            lettreTrouvee = true;
                        }
                    }
                    
                    if (!lettreTrouvee) {
                        essaisRestants--;
                        message = "La lettre " + lettre + " n'est pas dans le mot !";
                    } else {
                        message = "Bien joué ! La lettre " + lettre + " est dans le mot.";
                    }
                    
                    // Mettre à jour les attributs de session
                    session.setAttribute("motMasque", motMasque);
                    session.setAttribute("essaisRestants", essaisRestants);
                    session.setAttribute("lettresProposees", lettresProposees);
                }
            }
        }
        
        // Vérifier si la partie est terminée
        if (new String(motMasque).equals(motSecret)) {
            message = "Félicitations ! Vous avez trouvé le mot : " + motSecret;
            partieTerminee = true;
        } else if (essaisRestants <= 0) {
            message = "Désolé, vous avez perdu ! Le mot était : " + motSecret;
            partieTerminee = true;
        }
        %>
        
        <!-- Affichage du pendu -->
        <div class="hangman">
            <%
            String[] pendu = {
                "  __\n |    |\n |    O\n |   /|\\\n |   / \\\n|",
                "  __\n |    |\n |    O\n |   /|\\\n |   /\n|",
                "  __\n |    |\n |    O\n |   /|\\\n |\n|",
                "  __\n |    |\n |    O\n |   /|\n |\n|",
                "  __\n |    |\n |    O\n |    |\n |\n|",
                "  __\n |    |\n |    O\n |\n |\n|",
                "  __\n |    |\n |\n |\n |\n|"
            };
            out.println("<pre>" + pendu[6 - essaisRestants] + "</pre>");
            %>
        </div>
        
        <!-- Affichage du mot masqué -->
        <div class="word-display">
            <%
            for (char c : motMasque) {
                out.print(c + " ");
            }
            %>
        </div>
        
        <!-- Affichage des informations de jeu -->
        <div class="message"><%= message %></div>
        <div class="guessed-letters">
            Lettres proposées: 
            <%
            for (char c : lettresProposees) {
                out.print(c + " ");
            }
            %>
        </div>
        <div>Essais restants: <%= essaisRestants %></div>
        
        <!-- Formulaire de proposition de lettre -->
        <% if (!partieTerminee) { %>
        <form method="post">
            <label for="lettre">Proposez une lettre :</label>
            <input type="text" id="lettre" name="lettre" class="letter-input" maxlength="1" required 
                   pattern="[A-Za-z]" title="Veuillez entrer une seule lettre">
            <button type="submit">Essayer</button>
        </form>
        <% } %>
        
        <!-- Bouton pour une nouvelle partie -->
        <form method="post">
            <input type="hidden" name="nouvellePartie" value="true">
            <button type="submit" class="restart-btn">Nouvelle partie</button>
        </form>
    </div>
</body>
</html>
