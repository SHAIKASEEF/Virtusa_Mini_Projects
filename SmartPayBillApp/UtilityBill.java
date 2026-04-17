public class UtilityBill implements Billable {

    private String customerName;
    private int previousReading;
    private int currentReading;

    public UtilityBill(String customerName, int previousReading, int currentReading) {
        this.customerName = customerName;
        this.previousReading = previousReading;
        this.currentReading = currentReading;
    }

    public int getUnitsConsumed() {
        return currentReading - previousReading;
    }

    @Override
    public double calculateTotal(int units) {
        double total = 0;

        if (units <= 100) {
            total = units * 1;
        } else if (units <= 300) {
            total = (100 * 1) + (units - 100) * 2;
        } else {
            total = (100 * 1) + (200 * 2) + (units - 300) * 5;
        }

        return total;
    }

    public void generateBill() {
        int units = getUnitsConsumed();
        double total = calculateTotal(units);

        System.out.println("\n===== DIGITAL RECEIPT =====");
        System.out.println("Customer Name: " + customerName);
        System.out.println("Units Consumed: " + units);
        System.out.println("Total Amount: $" + total);
        System.out.println("============================\n");
    }
}