const express = require('express');
const router = express.Router();
const con = require('../config/db');


router.get('/:id', (req, res) => {
    const userID = req.params.id;

    con.query("SELECT * FROM user WHERE userID = ?;",
    userID,
    (err, results) => {
        if(err){
            console.error(err);
            res.status(500).json({errorMessage: err});
        }

        if(results.length === 0){
            res.json({
                message: "User doesn't exist"
            });
        }
        
        res.json(results[0]);
    });
});

router.post('/register', (req, res) =>{

    const loginID = req.body.loginID;
    const password = req.body.password;

    con.query("INSERT INTO user (loginID, password) VALUES (?, ?);",
    [loginID, password],
    (err, results) => {
        res.send(results);

        con.query("SELECT userID FROM user WHERE loginID = ?",
        [loginID],
        ((err2, results2)=>{
            const userID = results2[0].userID;
            con.query("INSERT INTO credentials (userID_credential, loginID_credential, password_credential) VALUES (?, ?, ?)",
            [loginID, loginID, password],
            ((err, results)=>{
                console.log(err)
            })
            )
        }))
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