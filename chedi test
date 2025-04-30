import java.util.*;

class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int L = in.nextInt(); // largeur d'une lettre
        int H = in.nextInt(); // hauteur d'une lettre
        in.nextLine(); // consommer le retour à la ligne
        String T = in.nextLine().toUpperCase(); // texte à transformer

        String[] rows = new String[H];
        for (int i = 0; i < H; i++) {
            rows[i] = in.nextLine(); // lignes de l'alphabet ASCII
        }

        for (int i = 0; i < H; i++) {
            StringBuilder line = new StringBuilder();
            for (char c : T.toCharArray()) {
                int index = c - 'A';
                if (index < 0 || index > 25) {
                    index = 26; // utiliser '?' si le caractère n'est pas une lettre
                }
                int start = index * L;
                int end = start + L;
                line.append(rows[i], start, end);
            }
            System.out.println(line.toString());
        }
    }
}
