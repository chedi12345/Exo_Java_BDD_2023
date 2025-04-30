<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ASCII Art - Lettres et Chiffres</title>
      <style>
        body {
            font-family: 'Courier New', monospace;
            background: linear-gradient(135deg, #1e1e2f, #2a2a40);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }

        h1 {
            font-size: 36px;
            color: #00ffc3;
            text-shadow: 0 0 5px #00ffc3, 0 0 15px #00ffc3;
            animation: glow 1.5s ease-in-out infinite alternate;
        }

        form {
            margin-top: 20px;
            background-color: #282c34;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 255, 195, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

        label, input[type="text"] {
            font-size: 18px;
            color: #fff;
        }

        input[type="text"] {
            background-color: #1f1f2e;
            border: 1px solid #00ffc3;
            border-radius: 5px;
            padding: 8px;
            color: #00ffc3;
            width: 300px;
            transition: 0.3s;
        }

        input[type="text"]:focus {
            outline: none;
            box-shadow: 0 0 8px #00ffc3;
            background-color: #2b2b3d;
        }

        button {
            padding: 10px 20px;
            background-color: #00ffc3;
            color: #1e1e2f;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #00caa5;
        }

        .ascii-container {
            margin-top: 30px;
            background-color: #1f1f2e;
            padding: 20px;
            border-radius: 12px;
            width: 100%;
            max-width: 800px;
            box-shadow: 0 0 20px rgba(0,255,195,0.2);
            overflow-x: auto;
            animation: fadeIn 1s ease-in-out;
        }

        pre {
            font-family: 'Courier New', monospace;
            font-size: 18px;
            color: #00ffc3;
            margin: 0;
            line-height: 1.2;
            letter-spacing: 1px;
            animation: type 0.8s steps(40, end) 1;
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 5px #00ffc3, 0 0 10px #00ffc3;
            }
            to {
                text-shadow: 0 0 20px #00ffc3, 0 0 30px #00ffc3;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes type {
            from { width: 0 }
            to { width: 100% }
        }
    </style>
</head>
<body>
    <h1>ASCII ART (A–Z et 0–9)</h1>

    <form method="post">
        Entrez un mot ou nombre : <input type="text" name="text" />
        <input type="submit" value="Afficher" />
    </form>

<%
    int L = 4;
    int H = 5;

    String input = request.getParameter("text");
    if (input != null && !input.isEmpty()) {
        input = input.toUpperCase();

        String[] rows = new String[H];
        rows[0] = " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ### ### ##   ## ### # # # # # # # # # # ### ###  ## ### ###  ## ### ### ### ### ### ";
        rows[1] = "# # # # #   # # #   #   #   # #  #    # ##  #   ### # # # # # # # # # # #    #  # # # # # # # #  #    # # # # # # #   # # # #   #   # # # # # # ";
        rows[2] = "### ##  #   # # ##  ##  # # ###  #    # #   #   # # # # # # ### # # ##  ###  #  # # # # # #  #   #   #  # #   #  #  ### ### ### ###   # ### ### ";
        rows[3] = "# # # # #   # # #   #   # # # #  #    # ##  #   # # # # # # #   ### # #   #  #  # # # # ### # #  #  #   # #   # #     #   #   # # #   # # #   # ";
        rows[4] = "# # ##   ## ##  ### #   ### # # ### ### # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ### ###   # ### ###   # ### ###   # ### ### ";

        StringBuilder[] asciiLines = new StringBuilder[H];
        for (int i = 0; i < H; i++) {
            asciiLines[i] = new StringBuilder();
        }

        for (int j = 0; j < input.length(); j++) {
            char c = input.charAt(j);
            int index;
            if (c >= 'A' && c <= 'Z') {
                index = c - 'A'; // 0–25
            } else if (c >= '0' && c <= '9') {
                index = 26 + (c - '0'); // 26–35
            } else {
                index = -1; // caractère inconnu
            }

            for (int i = 0; i < H; i++) {
                if (index >= 0) {
                    int start = index * L;
                    int end = start + L;
                    if (end <= rows[i].length()) {
                        asciiLines[i].append(rows[i].substring(start, end));
                    } else {
                        asciiLines[i].append("????");
                    }
                } else {
                    asciiLines[i].append("????");
                }
            }
        }

        out.println("<pre>");
        for (int i = 0; i < H; i++) {
            out.println(asciiLines[i].toString());
        }
        out.println("</pre>");
    }
%>

</body>
</html>
