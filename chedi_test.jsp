<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Generator</title>
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

            String[] asciiAlphabet = {
                " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
                "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
                "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
                "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
                "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
            };

            for (int row = 0; row < H; row++) {
                out.print("<pre>");
                for (char ch : textToPrint.toCharArray()) {
                    int index = (ch >= 'A' && ch <= 'Z') ? ch - 'A' : 26;
                    int start = index * L;
                    if (start + L <= asciiAlphabet[row].length()) {
                        out.print(asciiAlphabet[row].substring(start, start + L));
                    } else {
                        out.print(" ".repeat(L));
                    }
                }
                out.println("</pre>");
            }
        }
    %>
    </div>
</body>
</html>

