import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Library lib = new Library();

        while (true) {
            System.out.println("\n1. Add Book");
            System.out.println("2. Register User");
            System.out.println("3. Issue Book");
            System.out.println("4. Return Book");
            System.out.println("5. Search Book");
            System.out.println("6. Exit");

            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Book ID: ");
                    int bid = sc.nextInt();
                    sc.nextLine();
                    System.out.print("Title: ");
                    String title = sc.nextLine();
                    System.out.print("Author: ");
                    String author = sc.nextLine();
                    lib.addBook(new Book(bid, title, author));
                    break;

                case 2:
                    System.out.print("User ID: ");
                    int uid = sc.nextInt();
                    sc.nextLine();
                    System.out.print("Name: ");
                    String name = sc.nextLine();
                    lib.registerUser(new User(uid, name));
                    break;

                case 3:
                    System.out.print("Book ID: ");
                    int b = sc.nextInt();
                    System.out.print("User ID: ");
                    int u = sc.nextInt();
                    lib.issueBook(b, u);
                    break;

                case 4:
                    System.out.print("Book ID: ");
                    int rb = sc.nextInt();
                    lib.returnBook(rb);
                    break;

                case 5:
                    sc.nextLine();
                    System.out.print("Search keyword: ");
                    String key = sc.nextLine();
                    lib.searchBook(key);
                    break;

                case 6:
                    System.exit(0);
            }
        }
    }
}