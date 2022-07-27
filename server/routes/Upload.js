const express = require('express');
const router = express.Router();
const con = require('../config/db');


router.post('/', (req, res) =>{
    const title = req.body.title;
    const caption = req.body.caption;
    const imgId = req.body.imgId;
    const userId = req.body.userId;

    con.query("INSERT INTO post (title, caption, imgId, userId) VALUES (?, ?, ?, ?);",
    [title, caption, imgId, userId],
    (err, results) => {
        //console.log(err);
        res.send(results);
    });
});

router.get("/", (req, res) => {
    con.query("SELECT * FROM post", (err, results)=>{
        if(err){
            console.log(err);
        }
        res.send(results);
    });
})

router.post("/like", (req, res)=>{

    const userLikes = req.body.userLikes;
    const postId = req.body.postId;

    //console.log(userLikes);
    //console.log(postId);

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