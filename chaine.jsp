public class chaine {
    public static void main(String[] args) {
        // Déclaration de la chaîne
        String bonjour = "salut la compagnie";

        // Afficher le message en majuscules
        System.out.println(bonjour.toUpperCase());

        // Méthode pour mettre la première lettre en majuscule
        System.out.println(capitalizeFirstLetter(bonjour));
    }

    // Méthode pour capitaliser la première lettre
    public static String capitalizeFirstLetter(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }
}
