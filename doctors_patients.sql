-- from the terminal run:
-- psql < doctors_patients.sql

DROP DATABASE IF EXISTS doctors_patients;

CREATE DATABASE doctors_patients;

\c doctors_patients

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  doctor_name TEXT,
  specialty TEXT
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors,
  patient_id INTEGER REFERENCES patients,
  visit_date DATE
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  patient_name TEXT,
  insurance TEXT,
  birthday DATE
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease_name TEXT,
  description TEXT
);

CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits,
  disee_id INTEGER REFERENCES diseases,
  notes TEXT
);

INSERT INTO doctors 
  (doctor_name, specialty)
VALUES
  ('Doctor Funke', 'Analysis Therapist'),
  ('Doctor Kavorkian', 'End-of-Life'),
  ('Doctor Doom', 'Trauma');

INSERT INTO visits 
  (doctor_id, patient_id, date)
VALUES
  (1, 1, '08-08-2023'),
  (2, 2, '09-25-2023'),
  (3, 3, '11-11-2023');

INSERT INTO patients 
  (patient_name, insurance, birthday)
VALUES
  ('Robert Roda', 'Kaiser', '01-28-1984'),
  ('Lindsay Allen', 'Regence', '04-20-1985'),
  ('Ryan Evans', 'OHSU', '10-21-1988');

INSERT INTO diseases 
  (disease_name, description)
VALUES
  ('Pink Eye', 'swelling and redness around the eye'),
  ('Common Cold', 'Cough, runny nose, fatigue, and occionally a fever'),
  ('Homesickness', 'Overwhelming sadness');

INSERT INTO diagnosis 
  (visit_id, disease_id, notes)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);
