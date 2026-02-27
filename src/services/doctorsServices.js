import {pool} from "../config/postgres.js";

async function getDoctors() {
    const client = await pool.connect()
    try {
        const response = await client.query('SELECT * FROM doctors')
        return response
    } catch (error) {
        console.error(error);
    }finally{
        client.release()
    }
}

export {
    getDoctors
}