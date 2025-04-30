<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>ASCII Art - JSP Version</title>
</head>
<body>
<h2>ASCII Art en Java JSP</h2>

<form method="post">
    <label>Largeur (L) : <input type="number" name="L" required></label><br>
    <label>Hauteur (H) : <input type="number" name="H" required></label><br>
    <label>Texte à convertir : <input type="text" name="T" required></label><br><br>
    
    <label>Alphabet ASCII (27 lettres par ligne, séparées par '|') :</label><br>
    <textarea name="ascii" rows="10" cols="100" required></textarea><br><br>

    <input type="submit" value="Afficher ASCII Art">
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        int L = Integer.parseInt(request.getParameter("L"));
        int H = Integer.parseInt(request.getParameter("H"));
        String T = request.getParameter("T").toUpperCase();
        String asciiRaw = request.getParameter("ascii");

        String[] rows = asciiRaw.split("\\|");
        if (rows.length != H) {
%>
            <p style="color: red;">Erreur : vous devez fournir exactement <%= H %> lignes séparées par '|'.</p>
<%
        } else {
%>
            <h3>Résultat ASCII Art :</h3>
            <pre style="font-family: monospace;">
<%
            for (int i = 0; i < H; i++) {
                StringBuilder line = new StringBuilder();
                for (char c : T.toCharArray()) {
                    int index = c - 'A';
                    if (index < 0 || index > 25) {
                        index = 26; // utiliser '?' pour les caractères non alphabétiques
                    }
                    int start = index * L;
                    int end = start + L;

                    if (start >= 0 && end <= rows[i].length()) {
                        line.append(rows[i].substring(start, end));
                    } else {
                        line.append(" ".repeat(L)); // en cas de mauvaise longueur
                    }
                }
                out.println(line.toString());
            }
%>
            </pre>
<%
        }
    } catch (Exception e) {
%>
        <p style="color: red;">Erreur dans les données fournies : <%= e.getMessage() %></p>
<%
    }
}
%>
</body>
</html>
