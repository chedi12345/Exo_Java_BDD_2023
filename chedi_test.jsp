import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int L = in.nextInt(); // largeur de chaque lettre
        int H = in.nextInt(); // hauteur de chaque lettre
        in.nextLine(); // consomme le retour à la ligne

        String T = in.nextLine().toUpperCase(); // texte à afficher
        String[] rows = new String[H];

        // Lecture des lignes ASCII
        for (int i = 0; i < H; i++) {
            rows[i] = in.nextLine();
        }

        // Affichage ligne par ligne
        for (int i = 0; i < H; i++) {
            StringBuilder line = new StringBuilder();

            for (char c : T.toCharArray()) {
                int index = c - 'A';
                if (index < 0 || index > 25) {
                    index = 26; // caractère non alphabétique → '?'
                }

                int start = index * L;
                int end = start + L;

                // Vérification de la sécurité des index
                if (start >= 0 && end <= rows[i].length()) {
                    line.append(rows[i], start, end);
                } else {
                    // Si ligne trop courte, ajouter des espaces
                    line.append(" ".repeat(L));
                }
            }

            System.out.println(line.toString());
        }

        in.close();
    }
}
