CREATE DATABASE hospital_db;
USE hospital_db;

--- Patients table creation
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);

--- Doctors table creation
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100)
);

--- Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

--- Treatments table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis VARCHAR(255),
    cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

--- Sample Data Insertion
-- Patients
INSERT INTO patients VALUES
(1, 'Amit', 25, 'Male'),
(2, 'Priya', 30, 'Female'),
(3, 'Rahul', 40, 'Male');

-- Doctors
INSERT INTO doctors VALUES
(1, 'Dr. Sharma', 'Cardiology'),
(2, 'Dr. Mehta', 'Neurology');

-- Appointments
INSERT INTO appointments VALUES
(1, 1, 1, '2025-04-01'),
(2, 2, 1, '2025-04-02'),
(3, 3, 2, '2025-04-03'),
(4, 1, 1, '2025-04-10');

-- Treatments
INSERT INTO treatments VALUES
(1, 1, 'Heart Issue', 5000),
(2, 2, 'Migraine', 2000),
(3, 3, 'Stroke', 8000),
(4, 1, 'Follow-up', 1500);


--- Most Consulted Doctor
SELECT d.name, COUNT(a.appointment_id) AS total_visits
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name
ORDER BY total_visits DESC;

---Total Revenue Per Month
SELECT MONTH(a.date) AS month, SUM(t.cost) AS total_revenue
FROM treatments t
JOIN appointments a ON t.patient_id = a.patient_id
GROUP BY month;

--- Most Common Diseases
SELECT diagnosis, COUNT(*) AS frequency
FROM treatments
GROUP BY diagnosis
ORDER BY frequency DESC;

--- Patient Visit Frequency
SELECT patient_id, COUNT(*) AS visit_count
FROM appointments
GROUP BY patient_id
ORDER BY visit_count DESC;

---Doctor Performance
SELECT d.name,
       COUNT(a.appointment_id) AS total_patients,
       SUM(t.cost) AS revenue_generated
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN treatments t ON a.patient_id = t.patient_id
GROUP BY d.name;