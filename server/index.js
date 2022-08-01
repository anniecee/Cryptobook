const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors());
app.use(express.json());

const userRoute = require('./routes/User');
app.use('/user', userRoute);

const uploadRoute = require('./routes/Upload');
app.use('/upload', uploadRoute);


//Add route to searchpost
const searchPostRoute = require('./routes/SearchPost');
app.use('/searchPost', searchPostRoute);

//Add route to postinfo
const postInfoRoute = require('./routes/PostInfo');
app.use('/postInfo', postInfoRoute);

const TransactionsRoute = require('./routes/Transactions');
app.use('/transactions', TransactionsRoute);


app.listen(3001, (req, res) => {
    console.log('Server running.');
})