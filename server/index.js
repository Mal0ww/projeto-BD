const express = require("express");
const app = express();
const mysql = require ("mysql2");
const cors = require("cors");
const { json } = require("express");

const db = mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "password",
    port: 3306,
    database: "trabalho_banco"
});

app.use(cors());
app.use(express.json());

app.post("/cadastro", (req, res) =>{
    const {cpf} = req.body;
    const {nome_usuario} = req.body;
    const {senha} = req.body; 
    const {primeiro_nome} = req.body;
    const {sobrenome} = req.body;
    const {email} = req.body;
    const {data_nasci} = req.body; 
    const {cidade} = req.body;
    const {uf} = req.body;

    const sql = "INSERT INTO usuario (cpf, nome_usuario, senha, primeiro_nome, sobrenome, email, data_nasci, cidade, uf) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    
    db.query(sql,[cpf, nome_usuario, senha, primeiro_nome, sobrenome, email, data_nasci, cidade, uf],(err, result) => {
        console.log(err);
    })
});

app.listen(3001, () => {
    console.log("O pai ta ON!");
})
