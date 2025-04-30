<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Generator</title>
    <style>
        /* [Le CSS reste exactement le même] */
        body {
            font-family: 'Courier New', monospace;
            background: linear-gradient(135deg, #1e1e2f, #2a2a40);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }
        /* ... [Tout le reste du CSS identique] ... */
    </style>
</head>
<body>
    <h1>ASCII Art Generator</h1>

    <form method="post">
        <label for="inputText">Entrez un mot :</label>
        <input type="text" id="inputText" name="inputText" required />
        <button type="submit">Afficher</button>
    </form>

    <div class="ascii-container">
    <%
        String inputText = request.getParameter("inputText");
        if (inputText != null && !inputText.trim().isEmpty()) {
            String textToPrint = inputText.toUpperCase();

            int L = 4;
            int H = 5;

            // Tableau ASCII complet avec lettres A-Z et chiffres 0-9
            String[] asciiAlphabet = {
                // Lettres A-Z (26 lettres)
                " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
                "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
                "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
                "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
                "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  ",
                
                // Chiffres 0-9 (10 chiffres)
                " ### ##  # #  #  #   #  #  # #  ##  ###  ### ",
                " #   # # # #  #  #   #  #  # # #   #   # # # ",
                " #  ##  # #  # #  #  #  # # # #  ##   #  ## ",
                " #   #  # #  # #  #  #  # # # # #   # #   # ",
                " ### ##   #   #   #   #   #  ##  ###  #  #  "
            };

            for (int row = 0; row < H; row++) {
                out.print("<pre>");
                for (char ch : textToPrint.toCharArray()) {
                    int index;
                    if (ch >= 'A' && ch <= 'Z') {
                        index = ch - 'A';  // Index des lettres (0-25)
                    } else if (ch >= '0' && ch <= '9') {
                        index = 26 + (ch - '0');  // Index des chiffres (26-35)
                    } else {
                        index = -1;  // Caractère non reconnu
                    }
                    
                    if (index >= 0 && index < 36) {  // 26 lettres + 10 chiffres
                        int start = index * L;
                        if (start + L <= asciiAlphabet[row].length()) {
                            out.print(asciiAlphabet[row].substring(start, start + L));
                        } else {
                            out.print(" ".repeat(L));
                        }
                    } else {
                        out.print(" ".repeat(L));  // Espaces pour caractères non reconnus
                    }
                }
                out.println("</pre>");
            }
        }
    %>
    </div>
</body>
</html>
