const express = require('express');
const router = express.Router();
const con = require('../config/db');

router.get('/', (req, res)=>{
    const {crypto, price, type, time} = req.query;

    var attributes = "";

    if(crypto === 'true'){
        attributes += "crypto,";
    }
    if(price === 'true'){
        attributes += "price,";
    }
    if(type === 'true'){
        attributes += "type,";
    }
    if(time === 'true'){
        attributes += "time";
    }

    if(attributes.slice(-1) === ","){
        attributes = attributes.substring(0, attributes.length - 1);
    }

    con.query(`SELECT ${attributes} FROM transaction`,
    (err, results)=>{
        res.send(results);
    });

});

module.exports = router;