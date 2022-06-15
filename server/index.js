 console.log("Helllo There");

const express = require('express');

const PORT = 3000;

const app = express();
// Creating API

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`Connected at ${PORT}`);
});
