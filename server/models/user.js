const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    name: {
        required : true,
        type: String,
        trim: true,
    },

    email:{
        required : true,
        trim : true,
        type : String,
        validate: {
            validator: (value)=>{
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re)
            },
            message:' Please Enter valid Email'
        },
    },
    password :{
        required: true,
        type: String,
    },
    address:{
        type:String,
        default: '',
    },

    type:{
        type: String,
        default: 'user',
    },
    //Cart
});

const User = mongoose.model("User",userSchema);
module.exports = User;