import express from "express";
import simulacroRoutes from "./routes/simulacro.routes.js";

const app = express();

app.use(express.json());

app.use("/api/simulacro", simulacroRoutes);

export default app;
