const express = require('express');
const router = express.Router();
const con = require('../config/db');


// Search by Like
    // Selection query
    // Select all post have more than X likecounts
router.get("/byLike", (req, res) => {
    const {like} = req.query;

    con.query("SELECT * FROM post WHERE likeCount >= ?"
        , [like], (err, results)=>{
            if(err){
                console.log(err);
            }
            console.log(results.data);
            res.send(results);
        });
})

module.exports = router;