import mysql from 'mysql2';
import dotenv from 'dotenv';
dotenv.config();

const pool = mysql
    .createPool({
        host: process.env.MYSQL_HOST,
        user: process.env.MYSQL_USER,
        password: process.env.MYSQL_PASSWORD,
        database: process.env.MYSQL_DATABASE,
    })
    .promise();

export async function getUser(id) {
    const [rows] = await pool.query('SELECT * FROM usuarios WHERE id = ?', [id]);
    return rows[0];
}

export async function getFood(id) {
    const [rows] = await pool.query('SELECT * FROM alimentos WHERE id = ?', [id]);
    return rows[0];
}

export async function getDishe(id) {
    const [rows] = await pool.query('SELECT * FROM platos WHERE id = ?', [id]);
    return rows[0];
}

export async function getExercise(id) {
    const [rows] = await pool.query('SELECT * FROM ejercicios WHERE id = ?', [id]);
    return rows[0];
}

export async function getHabit(id) {
    const [rows] = await pool.query('SELECT * FROM habitos WHERE id = ?', [id]);
    return rows[0];
}

export async function createUser(id, correo, nombres, edad, peso, estatura, password) {
    const [result] = await pool.query(
        'INSERT INTO usuarios (id, correo, nombres, edad, peso, estatura, password) VALUES (?, ?, ?, ?, ?, ?, ?)'
        ,
        [id, correo, nombres, edad, peso, estatura, password]
    );
    const userId = result.insertId;
    return getUser(userId);
}

export async function createFood(id, nombre, proteinas, grasas, carbohidratos) {
    const [result] = await pool.query(
        'INSERT INTO alimentos (id, nombre, proteinas, grasas, carbohidratos) VALUES (?, ?, ?, ?, ?)'
        ,
        [id, nombre, proteinas, grasas, carbohidratos]
    );
    const foodId = result.insertId;
    return getFood(foodId);
}

export async function createDish(id, nombre, proteinas, grasas, carbohidratos) {
    const [result] = await pool.query(
        'INSERT INTO platos (id, nombre, proteinas, grasas, carbohidratos) VALUES (?, ?, ?, ?, ?)'
        ,
        [id, nombre, proteinas, grasas, carbohidratos]
    );
    const dishId = result.insertId;
    return getDishe(dishId);
}

export async function createExercise(id, nombre, desgaste_fisico, calorias_consumidas) {
    const [result] = await pool.query(
        'INSERT INTO ejercicios (id, nombre, desgaste_fisico, calorias_consumidas) VALUES (?, ?, ?, ?)'
        ,
        [id, nombre, desgaste_fisico, calorias_consumidas]
    );
    const exerciseId = result.insertId;
    return getExercise(exerciseId);
}
