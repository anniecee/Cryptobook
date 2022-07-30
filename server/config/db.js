const mysql = require('mysql');

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "cmpt354",
    port: process.env.DB_PORT || 3312,
    database: "cryptodatabase"
});

module.exports = con;