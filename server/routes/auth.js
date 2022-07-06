const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();

// SIGN UP  
authRouter.post('/api/signup', async (req,res) => { 
  try{
    
    const {name,email,password} = req.body;
    
    const existUser = await User.findOne({email});
    if(existUser) {
        return res.status(400).json({msg : "User with Same Email Alreay exist!!"})
    }

    const hashedPasword = await bcryptjs.hash(password,8);

    let user = new User({
        email,
        password: hashedPasword,
        name, 
    })
    user =  await user.save();
    res.json(user);
  }
  catch(e){
    res.status(500).json({error : e.message});
  }
     // post data into Database
     // return data to user
});

module.exports = authRouter;