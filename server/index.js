const express = require('express');
const mongoose = require('mongoose');
const PORT = 3000;

const authRouter = require('./routes/auth');
const app = express();
const DB = "mongodb+srv://Dhruval:dhruvalMDDK257@cluster0.dewuzkv.mongodb.net/?retryWrites=true&w=majority";


//middleware
app.use(express.json())
app.use(authRouter);


//connection
mongoose.connect(DB).then(()=>{
    console.log('Successfull');
})
   .catch((e)=>{
    console.log(e);
   })
// Creating API

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`Connected at ${PORT}`);
});
