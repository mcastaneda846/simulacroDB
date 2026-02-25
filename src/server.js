import { createTables } from "./config/postgres.js";
//import app from "./app.js";
import { env } from "./config/env.js";

try {
  console.log("Conecting to postgres succesfull...");
  await createTables();
  console.log("Se conectó");

  app.listen(env.port, () => {
    console.log(`serving running on port ${env.port}`);
  });
} catch (error) {
  console.log("Error starting server");
}
