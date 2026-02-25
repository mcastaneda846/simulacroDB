CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(15),
  address VARCHAR(255)
);

CREATE TABLE specialty (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  specialty INTEGER NOT NULL,
  CONSTRAINT fk_doctors_specialty
    FOREIGN KEY (specialty)
    REFERENCES specialty(id)
    ON DELETE RESTRICT
);

CREATE TABLE insurances (
  id SERIAL PRIMARY KEY,
  name_provider VARCHAR(255) NOT NULL,
  coverage_percentage DECIMAL(5,2) NOT NULL
    CHECK (coverage_percentage >= 0 AND coverage_percentage <= 100)
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  code VARCHAR(255) UNIQUE NOT NULL,
  description VARCHAR(255) NOT NULL,
  cost DECIMAL(10,2) NOT NULL CHECK (cost >= 0)
);

CREATE TABLE appointments (
  id SERIAL PRIMARY KEY,
  appointment_date DATE NOT NULL,
  amount_paid DECIMAL(10,2) NOT NULL CHECK (amount_paid >= 0),
  patient_id INTEGER NOT NULL,
  insurance_id INTEGER NOT NULL,
  doctor_id INTEGER NOT NULL,
  treatment_id INTEGER NOT NULL,

  CONSTRAINT fk_appointments_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients(id)
    ON DELETE RESTRICT,

  CONSTRAINT fk_appointments_insurance
    FOREIGN KEY (insurance_id)
    REFERENCES insurances(id)
    ON DELETE RESTRICT,

  CONSTRAINT fk_appointments_doctor
    FOREIGN KEY (doctor_id)
    REFERENCES doctors(id)
    ON DELETE RESTRICT,

  CONSTRAINT fk_appointments_treatment
    FOREIGN KEY (treatment_id)
    REFERENCES treatments(id)
    ON DELETE RESTRICT
);