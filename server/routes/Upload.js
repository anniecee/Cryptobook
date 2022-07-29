const express = require('express');
const router = express.Router();
const con = require('../config/db');

// Select all data from 4 tables: Post/ BuyPost/ SellPost / User
router.get("/", (req, res) => {
    con.query("SELECT * FROM post JOIN buypost ON postID = buypostID JOIN sellpost ON postID = sell_postID JOIN user ON userID_post = userID"
    , (err, results)=>{
        if(err){
            console.log(err);
        }
        res.send(results);
    });
})

// Upload post
// TBU
router.post('/', (req, res) =>{
    const title = req.body.title;
    const text = req.body.text;
    const imgId = req.body.imgId;
    const userId = req.body.userId;
    // update other attributes

    con.query("INSERT INTO post (userID_post, text, likeCount) VALUES (?, ?, ?);",
    [userId, text, 0],
    (err, results) => {
        //console.log(err);
        res.send(results);
    });
});

// Insert like event + update like count
// TBU
router.post("/like", (req, res)=>{

    const userLikes = req.body.userLikes;
    const postID = req.body.postID;

    // Insert like event
    con.query("INSERT INTO likeevent (postID_likeEvent, likeUserID) VALUES (?, ?);",
    [postID, userLikes],
    (err, results)=>{
        if(err){
            console.log(err);
        }
        
        // Update likeCount of post
        con.query("UPDATE post SET likeCount = likeCount + 1 WHERE postID = ?", 
        postID,
        (err2, result2)=>{
            if(err2){
                console.log(err2);
            }
            res.send(results);
        });
        }
    )
})

// Delete post
// TBU
router.delete("/delete", (req, res)=>{

    const postID = req.body.postID;
    console.log(postID);
    
    con.query("DELETE FROM post WHERE postID = ?",
    postID,
     (err, results)=>{
        if(err){
            console.log(err);
        }
        res.send(results);
    });
})



module.exports = router;