# 📚 Library Management System (Java)

## 📌 Overview

The **Library Management System** is a Java-based application designed to automate and manage core library operations such as book inventory, user registration, and transaction tracking.

This project eliminates manual record-keeping by providing an efficient system to **issue, return, and track books**, along with **fine calculation for late returns**.

---

## 🎯 Objectives

- Manage books, users, and transactions
- Track issued and returned books
- Reduce manual effort and improve efficiency

---

## 🚀 Features

### 📘 Book Management

- Add new books
- Remove or update book details
- Track availability status

### 👤 User Management

- Register new users
- Store user details

### 🔄 Transactions

- Issue books with date tracking
- Return books
- Maintain transaction history

### ⏰ Fine Calculation

- Automatic fine for late returns
- Configurable due period (default: 7 days)

### 🔍 Search Functionality

- Search books by:
  - Title
  - Author

---

## 🛠️ Tech Stack

- **Language:** Java

- **Concepts Used:**
  - Object-Oriented Programming (OOP)
  - Classes & Objects
  - Lists (ArrayList)
  - Exception Handling
  - Date & Time API

- **IDE:** VS Code

---

## 📂 Project Structure

```id="8f1d2k"
LibraryManagementSystem/
│
├── Main.java           # Entry point (menu-driven system)
├── Library.java        # Core logic (book/user/transaction handling)
├── Book.java           # Book entity
├── User.java           # User entity
├── Transaction.java    # Issue/return tracking
└── README.md
```

---

## ⚙️ How It Works

1. User selects an option from the menu
2. Based on input:
   - Add book or user
   - Issue or return a book
   - Search for books

3. System updates records accordingly
4. Fine is calculated if return exceeds due date

---

## ▶️ Getting Started

### 1️⃣ Clone the Repository

```id="3k92lm"
git clone https://github.com/your-username/LibraryManagementSystem.git
cd LibraryManagementSystem
```

### 2️⃣ Compile the Code

```id="2m8dkq"
javac *.java
```

### 3️⃣ Run the Application

```id="91dk2p"
java Main
```

---

## 🧪 Sample Workflow

```id="f82kdl"
1. Add Book → Enter ID, Title, Author
2. Register User → Enter ID, Name
3. Issue Book → Enter Book ID & User ID
4. Return Book → System calculates fine (if late)
5. Search Book → Enter keyword
```

---
