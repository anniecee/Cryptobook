const express = require('express');
const router = express.Router();
const con = require('../config/db');


// Search by Like
    // Selection query
    // Select all post have more than X likecounts
router.get("/byLike", (req, res) => {
    const {like} = req.query;

    console.log(like);

    con.query("SELECT * FROM post WHERE likeCount >= ?"
        , [like], (err, results)=>{
            if(err){
                console.log(err);
            }
            console.log(results.data);
            res.send(results);
        });
})

// Search by Real name of User
    // Division Query
    // Find all posts published by all users who names is X 
    // (2 users can have same name)
    // NOTE: check this division queries again
router.get("/byName", (req, res) => {
    const {name} = req.query;

    console.log(name);

    con.query("SELECT * FROM post JOIN user ON post.userID_post = user.userID WHERE user.name = ?"
        , [name], (err, results)=>{
            if(err){
                console.log(err);
            }
            console.log(results.data);
            res.send(results);
        });
})

// Search by Crypto
    // Join query
    // Find all posts which traded crypto X 
    // (by joining 3 tables: post, buypost, sellpost)
router.get("/byCrypto", (req, res) => {
    const {crypto} = req.query;

    console.log(crypto);

    //con.query("SELECT * FROM post JOIN transaction ON postID = postID_transaction WHERE crypto = ?"
    con.query("SELECT * FROM post LEFT JOIN sellpost ON postID = sell_postID LEFT JOIN buypost ON postID = buypostID  WHERE sellCrypto = ? OR buyCrypto = ?"
        , [crypto, crypto], (err, results)=>{
            if(err){
                console.log(err);
            }
            console.log(results.data);
            res.send(results);
        });
})

// Find max like post
    // Aggregation query
    // Find post with maximum like count
router.get("/maxLikePost", (req, res) => {

    con.query("SELECT * FROM post WHERE likeCount = ( SELECT MAX(likeCount) FROM post)"
        , (err, results)=>{
            if(err){
                console.log(err);
            }
            console.log(results.data);
            res.send(results);
        });
})

// Update according to Update.js in server
// TBU
router.post("/like", (req, res)=>{

    const userLikes = req.body.userLikes;
    const postId = req.body.postId;

    con.query("INSERT INTO likes (userLikes, postId) VALUES (?, ?);",
    [userLikes, postId],
    (err, results)=>{
        if(err){
            console.log(err);
        }
        //console.log(results);
        con.query("UPDATE post SET likes = likes + 1 WHERE postId = ?", 
        postId,
        (err2, result2)=>{
            res.send(results);
        });
        }
    )
})

// Update according to Update.js in server
// TBU
router.delete("/delete", (req, res)=>{

    const postId = req.body.postId;
    console.log(postId);
    
    con.query("DELETE FROM post WHERE postId = ?",
    postId,
     (err, results)=>{
        if(err){
            console.log(err);
        }
        res.send(results);
    });
})



module.exports = router;