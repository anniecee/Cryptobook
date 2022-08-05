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

router.post('/:id/change-password', (req, res) => {
    const userID = req.params.id;
    const newPassword = req.body.newPassword;

    con.query("UPDATE user SET password = ? WHERE userID = ?;",
    [newPassword, userID],
    (err, results) => {
        if(err){
            console.error(err);
            res.status(500).json({errorMessage: err});
        }
        if(results.changedRows > 0){
            res.json({newPassword});
        }
    });
});

router.post('/:id/change-username', (req, res) => {
    const userID = req.params.id;
    const newUsername = req.body.newUsername;
    
    con.query("UPDATE user SET userName_user = ? WHERE userID = ?;",
    [newUsername, userID],
    (err, results) => {
        console.error(err);
        if(err){
            console.error(err);
            res.status(500).json({errorMessage: err});
        }
        if(results.changedRows > 0){
            res.json({newUsername});
        }
    });
});

router.post('/register', (req, res) =>{

    const loginID = req.body.data.loginID;
    const password = req.body.data.password;
    const email = req.body.data.email;
    const userName_user = req.body.data.userName_user;
    const name = req.body.data.name;

    con.query("INSERT INTO credentials (loginID_credential, password_credential) VALUES (?, ?)",
    [loginID, password],
    (err, results)=>{
        if(err){console.log(err)}
    })

    con.query("INSERT INTO user (loginID, password, email, userName_user, name) VALUES (?, ?, ?, ?, ?);",
    [loginID, password, email, userName_user, name],
    (err, results) => {
        console.log(err);
        con.query("SELECT userID FROM user WHERE loginID = ?",
        [loginID],
        ((err2, results2)=>{
            if(results2.length === 0){
                return res.json({errorMessage: "User not found"})
            }

            const userID = results2[0].userID;

            con.query("INSERT INTO account (userID_account) VALUES (?)",
            [userID],
            (err, results)=>{
                if(err){
                    console.log(err);
                }
                
            }
            )

            var resultsFinal = {
                loginID: loginID,
                userID: userID,
                userName_user: userName_user
            }
            res.send(resultsFinal);

            
        }))
    });



    
});

router.post('/login', (req, res) =>{

    const loginID = req.body.data.loginID;
    const password = req.body.data.password;

    console.log("Got request", loginID, password);
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