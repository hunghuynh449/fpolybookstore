var express = require('express');
var router = express.Router();
var db=require('../models/database'); 

router.get('/', (req, res) => {
    res.render('signup', {title:"Đăng ký"});
})

router.post('/handle', (req, res) => {
    let u = req.body.name_account;
    let p = req.body.pass_account;
    let em = req.body.email_account; 

    const bcrypt = require("bcrypt");        
    var salt = bcrypt.genSaltSync(10);
    var pass_mahoa = bcrypt.hashSync(p, salt);

    let user_info ={fullname: u, password:pass_mahoa, email:em};  
    let sql = 'INSERT INTO users SET ?';
    db.query(sql, user_info);
    res.redirect("/login");
})

module.exports = router;
