const express = require('express');
const router = express.Router();
const con = require('../config/db');

router.get("/", (req, res)=>{
     const userID = req.query.userID;

     con.query("SELECT * FROM account WHERE userID_account = ?",
     [userID],
     (err, results)=>{
        if(err){
            console.log(err);
        }else{
            res.send(results);
        }

     })
});

router.get("/cards", (req, res)=>{
    const userID = req.query.userID;

    con.query("SELECT * FROM bankinginfo WHERE userID_bankingInfo = ?",
    [userID],
    (err, results)=>{
        if(err){
            console.log(err);
        }
        res.send(results);
    });
});

router.post("/addcard", (req, res)=>{
    const userID = req.body.userID;
    const nameOnCard = req.body.nameOnCard;
    const cardNumber_bankinginfo = req.body.cardNumber;

    con.query("INSERT INTO bankinginfo (userID_bankingInfo, nameOnCard, cardNumber_bankinginfo) VALUES (?, ?, ?)",
    [userID, nameOnCard, cardNumber_bankinginfo],
    (err, results)=>{
        if(err){
            console.log(err);
        }
        con.query("SELECT * FROM bankinginfo WHERE userID_bankingInfo=?",
        [userID],
        (err2, results2)=>{
            res.send(results2);
        })

    })
})

module.exports = router;