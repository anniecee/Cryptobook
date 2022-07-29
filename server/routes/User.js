const express = require('express');
const router = express.Router();
const con = require('../config/db');


router.post('/register', (req, res) =>{

    const loginID = req.body.loginID;
    const password = req.body.password;

    con.query("INSERT INTO credentials (userID_credential, loginID_credential, password_credential) VALUES (?, ?, ?)",
    [loginID, loginID, password],
    ((err, results)=>{
        console.log(err)
    })
    )

    con.query("INSERT INTO user (userID, loginID, password) VALUES (?, ?, ?);",
    [loginID, loginID, password],
    (err, results) => {
        console.log(err);
        res.send(results);
    });
});

router.post('/login', (req, res) =>{

    const loginID = req.body.loginID;
    const password = req.body.password;

    con.query("SELECT * FROM user WHERE loginID = ?;",
    loginID,
    (err, results) => {
        if(err){
            console.log(err);
        }
        if(results.length > 0){

            if(password == results[0].password){
                res.json({
                    loggedIn: true,
                    loginID: loginID,
                    userID: results[0].userID,
                    username: results[0].userName_user
                })
            }else{
                res.json({
                    loggedIn: false,
                    message: "Wrong password"
                });
            }
        }else{
            res.json({
                loggedIn: false,
                message: "User doesn't exist"
            });
        }
    });
});

module.exports = router;