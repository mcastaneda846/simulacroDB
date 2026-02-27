-- TABLA PACIENTES
CREATE TABLE IF NOT EXISTS patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(15),
  address VARCHAR(255)
);

-- TABLA ESPECIALIDADES
CREATE TABLE IF NOT EXISTS specialty (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

-- TABLA DOCTORES
CREATE TABLE IF NOT EXISTS doctors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  specialty INTEGER NOT NULL,
  CONSTRAINT fk_doctors_specialty
    FOREIGN KEY (specialty)
    REFERENCES specialty(id)
    ON DELETE RESTRICT
);

-- TABLA ASEGURADORAS
CREATE TABLE IF NOT EXISTS insurances (
  id SERIAL PRIMARY KEY,
  name_provider VARCHAR(255) NOT NULL UNIQUE,
  coverage_percentage DECIMAL(5,2) NOT NULL
    CHECK (coverage_percentage >= 0 AND coverage_percentage <= 100)
);

-- TABLA TRATAMIENTOS
CREATE TABLE IF NOT EXISTS treatments (
  id SERIAL PRIMARY KEY,
  code VARCHAR(255) UNIQUE NOT NULL,
  description VARCHAR(255) NOT NULL,
  cost DECIMAL(10,2) NOT NULL CHECK (cost >= 0)
);

-- TABLA CITAS
CREATE TABLE IF NOT EXISTS appointments (
  id SERIAL PRIMARY KEY,
  appointment_id VARCHAR(20) NOT NULL UNIQUE,
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
