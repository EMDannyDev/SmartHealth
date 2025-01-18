CREATE DATABASE HealthData;

USE HealthData;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(255) UNIQUE NOT NULL,
    nombres VARCHAR(255) NOT NULL,
    edad INT NOT NULL,
    peso DECIMAL(5, 2) NOT NULL,
    estatura DECIMAL(5, 2) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE platos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    proteinas DECIMAL(5, 2) NOT NULL,
    grasas DECIMAL(5, 2) NOT NULL,
    carbohidratos DECIMAL(5, 2) NOT NULL
);

CREATE TABLE alimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    proteinas DECIMAL(5, 2) NOT NULL,
    grasas DECIMAL(5, 2) NOT NULL,
    carbohidratos DECIMAL(5, 2) NOT NULL
);

CREATE TABLE ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    desgaste_fisico VARCHAR(255) NOT NULL,
    calorias_consumidas DECIMAL(6, 2) NOT NULL
);

CREATE TABLE usuario_platos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    plato_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (plato_id) REFERENCES platos(id)
);

CREATE TABLE usuario_alimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    alimento_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (alimento_id) REFERENCES alimentos(id)
);

CREATE TABLE usuario_ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    ejercicio_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (ejercicio_id) REFERENCES ejercicios(id)
);

CREATE TABLE habitos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

CREATE TABLE usuario_habitos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    habito_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (habito_id) REFERENCES habitos(id)
);

CREATE TABLE alimentos_recomendados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    proteinas DECIMAL(5, 2),
    grasas DECIMAL(5, 2),
    carbohidratos DECIMAL(5, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE platos_recomendados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    proteinas DECIMAL(5, 2),
    grasas DECIMAL(5, 2),
    carbohidratos DECIMAL(5, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE ejercicios_recomendados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    desgaste_fisico VARCHAR(255),
    calorias_consumidas DECIMAL(6, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
