# 🚖 FareCalc – Travel Fare Optimizer

## 📌 Overview

**FareCalc** is a Python-based backend script designed to calculate ride fares dynamically for a ride-sharing platform. The fare is computed based on **distance**, **vehicle type**, and **time of travel (surge pricing)**.

This project simulates real-world pricing logic used by services like Uber/Ola and demonstrates core Python concepts such as dictionaries, functions, conditional logic, and error handling.

---

## 🎯 Features

- 📊 Distance-based fare calculation
- 🚗 Multiple vehicle types (Economy, Premium, SUV)
- ⏰ Surge pricing during peak hours (5 PM – 8 PM)
- ⚠️ Error handling for invalid inputs
- 🧾 Generates a formatted price receipt

---

## 🛠️ Tech Stack

- **Language:** Python 3
- **IDE:** VS Code
- **Concepts Used:**
  - Functions
  - Dictionaries
  - Conditional Statements
  - Exception Handling

---

## 📂 Project Structure

```
FareCalc_Project/
│
├── fare_calc.py
└── README.md
```

---

## ⚙️ How It Works

1. User inputs:
   - Distance (in km)
   - Vehicle type
   - Hour of travel (0–23)

2. Base fare is calculated using:

   ```
   fare = distance × rate_per_km
   ```

3. Surge pricing applied:
   - If time is between **17–20 (5 PM – 8 PM)** → fare × 1.5

4. Final fare is displayed as a receipt.

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```
git clone https://github.com/your-username/FareCalc_Project.git
cd FareCalc_Project
```

### 2️⃣ Run the Script

```
python fare_calc.py
```

---

## 🧪 Sample Input & Output

### ✅ Normal Case

```
Enter distance (km): 10
Enter vehicle type: Economy
Enter hour: 10

Total Fare: ₹100
```

### 🔥 Surge Pricing Case

```
Enter distance (km): 10
Enter vehicle type: SUV
Enter hour: 18

Total Fare: ₹375
```

### ❌ Invalid Vehicle Type

```
Service Not Available
```

---
