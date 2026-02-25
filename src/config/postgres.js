import pg from "pg"; //grupo de conexiones, crea paquetes de 10 conexiones, se puede configuarra el tamaño
import { env } from "./env.js";

const { Pool } = pg;

const pool = new Pool({
  connectionString: env.postgresUri, //configuración para la url de la conexion
});

export async function createTables() {
  const client = await pool.connect();
  try {
    await client.query("BEGIN");
    // script to create table patients
    await client.query(``); // aca debo poner lo creado en sql.
    await client.query("COMMIT"); //Siempre debo poner esto para finalizar mi script
  } catch (error) {
    console.error("Error creando tablas", error);
    await client.query("ROLLBACK");
  } finally {
    client.release(); //liberar la conexión para poder usarlas después.
  }
}
