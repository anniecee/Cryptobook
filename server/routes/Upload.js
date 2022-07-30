const express = require('express');
const router = express.Router();
const con = require('../config/db');

// Select all data from 4 tables: Post/ BuyPost/ SellPost / User
router.get("/", (req, res) => {
    con.query("SELECT * FROM post LEFT JOIN buypost ON postID = buypostID LEFT JOIN sellpost ON postID = sell_postID JOIN user ON userID_post = userID;"
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
    const text = req.body.text;
    const type = req.body.type;
    const userID = req.body.userId;
    console.log(type);

    // Update post table
    con.query("INSERT INTO post (userID_post, text, likeCount, type) VALUES (?, ?, ?, ?);",
    [userID, text, 0, type]
    ,(err, results) => {
        if(err){
            console.log(err);
        }
        else {
            res.send(results);

            // // Update table sellpost
            // const sell_postID = results[0].;

            // if (type == "sell") {
            //     con.query("INSERT INTO sellpost (sell_postID, sell_transactionID, sellPrice, sellCrypto) VALUES (?, ?, ?, ?);",
            //     [userID, text, 0, type]
            //     ,(err, results) => {
            //         if(err){
            //             console.log(err);
            //         }
            // }
        }
    });

});

// Insert like event + update like count
router.post("/like", (req, res)=>{

    const loginIDLike = req.body.loginIDLike;
    const postID = req.body.postID;

    // Insert like event
    // (This code need to be optimized)
    con.query("SELECT userID FROM user WHERE loginID = ?", 
    [loginIDLike], 
    (err, results)=>{
        if(err) {
            console.log(err);
        }
        else {
            // Insert like UserID with loginID
            const userID = results[0].userID;
            //console.log(results[0].userID);

            con.query("INSERT INTO likeevent (postID_likeEvent, likeUserID) VALUES (?, ?);",
            [postID, userID],
            (err, results)=>{
                if(err){
                    console.log(err);
                    // // Delete likeevent instance
                    // con.query("DELETE FROM likeevent WHERE postID_likeEvent = ? AND likeUserID = ?;",
                    // [postID, userID],
                    // (err2, res2)=>{
                    //     if(err2){
                    //         console.log(err2);
                    //     }
                    //     res.send(res2);
                    //     // Decrement likeCount of post
                    //     con.query("UPDATE post SET likeCount = likeCount - 1 WHERE postID = ?",
                    //     postID,
                    //     (err3, res3)=>{
                    //         if(err3){
                    //             console.log(err3);
                    //         }
                    //         res.send(res3);
                    //     });
                    // });
                }
                else {
                    // Update likeCount of post
                    con.query("UPDATE post SET likeCount = likeCount + 1 WHERE postID = ?", 
                    postID,
                    (err4, res4)=>{
                        if(err4){
                            console.log(err4);
                        }
                        res.send(res4);
                    });
                    }
                }
            )
        }
    });

})

// Delete post
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