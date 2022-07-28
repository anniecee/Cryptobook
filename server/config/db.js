const mysql = require('mysql');

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "cmpt354",
    port: 3312,
    database: "cryptodatabase"
});

module.exports = con;