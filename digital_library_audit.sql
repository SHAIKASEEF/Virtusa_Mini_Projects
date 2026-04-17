-- Database creation
CREATE DATABASE digital_library;
USE digital_library;

-- Tables creation
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Category VARCHAR(100)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Email VARCHAR(255),
    JoinDate DATE
);

CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    StudentID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Sample data inserted
INSERT INTO Books (Title, Author, Category) VALUES
('DBMS Basics', 'Navathe', 'Education'),
('AI Fundamentals', 'Russell', 'Technology'),
('History of India', 'Bipan Chandra', 'History');

INSERT INTO Students (Name, Email, JoinDate) VALUES
('Aseef', 'aseef@gmail.com', '2022-06-01'),
('Rahul', 'rahul@gmail.com', '2021-07-10');

INSERT INTO IssuedBooks (BookID, StudentID, IssueDate, ReturnDate) VALUES
(1, 1, '2026-03-01', NULL),
(2, 2, '2026-03-25', '2026-04-01'),
(3, 1, '2026-03-20', NULL);

-- Overdue query working
SELECT 
    s.Name,
    b.Title,
    i.IssueDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL
AND DATEDIFF(CURDATE(), i.IssueDate) > 14;

-- Popular categories query working
SELECT 
    b.Category,
    COUNT(*) AS TotalBorrowed
FROM IssuedBooks i
JOIN Books b ON i.BookID = b.BookID
GROUP BY b.Category
ORDER BY TotalBorrowed DESC;

-- Cleanup query written
DELETE FROM Students
WHERE StudentID NOT IN (
    SELECT DISTINCT StudentID FROM IssuedBooks
    WHERE IssueDate >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
);

-- Penalty report generated
SELECT 
    s.Name,
    b.Title,
    i.IssueDate,
    DATEDIFF(CURDATE(), i.IssueDate) AS DaysOverdue
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL
AND DATEDIFF(CURDATE(), i.IssueDate) > 14;