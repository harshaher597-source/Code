import java.util.Scanner;

class Product {
    int id, qty;
    String name;
    double price;

    Product(int id, String name, double price, int qty) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.qty = qty;
    }

    double total() {
        return price * qty;
    }
}

public class EcommerceSystem {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of products: ");
        int n = sc.nextInt();

        Product[] p = new Product[n];
        double grandTotal = 0;

        for (int i = 0; i < n; i++) {
            System.out.println("\nEnter details of product " + (i + 1));
            System.out.print("ID: ");
            int id = sc.nextInt();
            System.out.print("Name: ");
            String name = sc.next();
            System.out.print("Price: ");
            double price = sc.nextDouble();
            System.out.print("Quantity: ");
            int qty = sc.nextInt();

            p[i] = new Product(id, name, price, qty);
            grandTotal += p[i].total();
        }

        double discount = 0;
        if (grandTotal >= 5000)
            discount = grandTotal * 0.20;
        else if (grandTotal >= 2000)
            discount = grandTotal * 0.10;
        else if (grandTotal >= 1000)
            discount = grandTotal * 0.05;

        double finalAmount = grandTotal - discount;

        System.out.println("\n------ Invoice ------");
        System.out.println("ID\tName\tPrice\tQty\tTotal");

        for (int i = 0; i < n; i++) {
            System.out.println(p[i].id + "\t" + p[i].name + "\t" +
                               p[i].price + "\t" + p[i].qty + "\t" +
                               p[i].total());
        }

        System.out.println("---------------------");
        System.out.println("Total: " + grandTotal);
        System.out.println("Discount: " + discount);
        System.out.println("Final Amount: " + finalAmount);

        sc.close();
    }
}
