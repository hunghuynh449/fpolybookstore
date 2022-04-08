var express = require('express');
var router = express.Router();
var db=require('../models/database'); 

router.get('/', (req, res) => {
    res.render('login', {title:"Đăng nhập"});
})

router.post('/handleLogin', async function(req, res) {
    let email = req.body.email_account;
    let p = req.body.pass_account;
    let sql = 'SELECT * FROM users WHERE email = ?';
    db.query(sql, [email] , (err, rows) => {   
        if (rows.length<=0) { 
            res.redirect("/login"); 
            return;
        }
        let user = rows[0];        
        let pass_fromdb = user.password;
        const bcrypt = require("bcrypt");        
        var kq = bcrypt.compareSync(p, pass_fromdb);
        if (kq){
            console.log("OK");

            var sess = req.session;
            sess.daDangNhap = true;
            sess.email = user.email;     
            sess.idUser = user.id;
            if (sess.back){ 
                console.log(sess.back);
                res.redirect(sess.back);
            }
            else {
                res.redirect("/");
            }
        }   
        else {
            console.log("Not OK");
            res.redirect("/login");
        }
    });   
});

module.exports = router;
