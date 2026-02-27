import mongoose from "mongoose";

const appointmentSchema = new mongoose.Schema({
  appointmentId: Number,
  doctorName: String,
  specialty: String,
  appointmentDate: Date,
  status: String,
  totalCost: Number,
});

const patientHistorySchema = new mongoose.Schema({
  patientId: Number,
  patientName: String,
  patientEmail: {
    type: String,
    index: true,
  },
  insuranceName: String,
  appointments: [appointmentSchema],
});

export const PatientHistory = mongoose.model(
  "PatientHistory",
  patientHistorySchema,
);
