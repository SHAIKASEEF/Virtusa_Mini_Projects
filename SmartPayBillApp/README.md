# SmartPay Utility Bill Generator

A Core Java-based application that calculates electricity/water bills using progressive slab rates and generates a digital receipt for users.

## What it does:

- Calculates bill based on units consumed using slab logic
- Applies different rates for different unit ranges
- Validates user input (previous reading vs current reading)
- Supports multiple customer entries in a loop
- Generates a formatted digital receipt with billing details

## Slab Logic:

- 0–100 units → $1 per unit
- 101–300 units → $2 per unit
- Above 300 units → $5 per unit

## Features:

- Input validation to prevent incorrect readings
- Interface-based design using `Billable`
- Modular structure with separate classes
- Console-based interaction for multiple users

## Project Structure:

- `Billable.java` → Interface with `calculateTotal()` method
- `UtilityBill.java` → Implements billing logic
- `SmartPayApp.java` → Main application (user interaction loop)
- `.class` files → Compiled Java files

## Usage:

Compile and run the program:

```bash
javac *.java
java SmartPayApp
```

## Notes:

- Ensure Java is installed and configured properly
- Input correct meter readings to avoid validation errors
- Program runs until the user chooses to exit

## Tech Stack:

- Core Java
- OOP Concepts (Interfaces, Classes, Methods)

## Output:

The program generates a digital receipt showing:

- Customer Name
- Units Consumed
- Tax Amount
- Final Bill Amount
