import java.util.*;

class Library {
    List<Book> books = new ArrayList<>();
    List<User> users = new ArrayList<>();
    List<Transaction> transactions = new ArrayList<>();

    void addBook(Book book) {
        books.add(book);
    }

    void registerUser(User user) {
        users.add(user);
    }

    void issueBook(int bookId, int userId) {
        for (Book b : books) {
            if (b.id == bookId && !b.isIssued) {
                b.isIssued = true;
                transactions.add(new Transaction(bookId, userId));
                System.out.println("Book Issued Successfully");
                return;
            }
        }
        System.out.println("Book not available");
    }

    void returnBook(int bookId) {
        for (Book b : books) {
            if (b.id == bookId && b.isIssued) {
                b.isIssued = false;

                for (Transaction t : transactions) {
                    if (t.bookId == bookId && t.returnDate == null) {
                        t.returnDate = java.time.LocalDate.now();

                        long days = java.time.temporal.ChronoUnit.DAYS.between(t.issueDate, t.returnDate);

                        if (days > 7) {
                            long fine = (days - 7) * 10;
                            System.out.println("Late return! Fine: ₹" + fine);
                        }

                        break;
                    }
                }

                System.out.println("Book Returned Successfully");
                return;
            }
        }
        System.out.println("Invalid return");
    }

    void searchBook(String keyword) {
        for (Book b : books) {
            if (b.title.contains(keyword) || b.author.contains(keyword)) {
                System.out.println(b.id + " - " + b.title + " by " + b.author);
            }
        }
    }
}