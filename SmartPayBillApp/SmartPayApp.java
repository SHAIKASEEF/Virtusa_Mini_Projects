import java.util.Scanner;

public class SmartPayApp {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.print("Enter Customer Name (or type Exit): ");
            String name = sc.nextLine();

            if (name.equalsIgnoreCase("Exit")) {
                System.out.println("Exiting application...");
                break;
            }

            System.out.print("Enter Previous Reading: ");
            int prev = sc.nextInt();

            System.out.print("Enter Current Reading: ");
            int curr = sc.nextInt();
            sc.nextLine();

            if (prev > curr) {
                System.out.println("Error: Previous reading cannot be greater than current reading!");
                continue;
            }

            UtilityBill bill = new UtilityBill(name, prev, curr);
            bill.generateBill();
        }

        sc.close();
    }
}