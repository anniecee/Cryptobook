const express = require('express');
const router = express.Router();
const con = require('../config/db');


router.get("/find", (req, res) => {

    con.query("SELECT DISTINCT P1.userID_post FROM post P1 WHERE NOT EXISTS (SELECT sellpost.sell_postID FROM sellpost WHERE sellpost.sell_postID NOT IN (SELECT P2.postID FROM post P2 WHERE P2.userID_post = P1.userID_post));"
        , (err, results)=>{
            if(err){
                console.log(err);
            }
            console.log(results.data);
            res.send(results);
        });
})

module.exports = router;