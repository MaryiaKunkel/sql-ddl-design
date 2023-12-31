DROP DATABASE medical_center_db;
CREATE medical_center_db;
\c medical_center_db;

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    doctor_name TEXT UNIQUE NOT NULL,
)

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    patient_name TEXT UNIQUE NOT NULL,
)

CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES doctors ON DELETE SET NULL,
    doctor_id INTEGER NOT NULL REFERENCES doctors ON DELETE SET NULL,
    disease_id INTEGER NOT NULL REFERENCES diseases ON DELETE SET NULL,
)

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL,
)
