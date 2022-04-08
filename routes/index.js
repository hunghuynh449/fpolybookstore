var express = require('express');
var router = express.Router();
var db=require('../models/database'); 
var nodemailer =  require('nodemailer');

/* GET home page. */
router.get('/', (req, res) => {
  let data = `
    <li><a href="/login">Đăng nhập</a></li>
    <li><a href="/forgotpass">Quên mật khẩu</a></li>
    <li><a href="/signup">Đăng ký</a></li>
  `
  if (req.session.daDangNhap){
    data = `
      <li><a href="/changepass">Đổi mật khẩu</a></li>
      <li><a href="/forgotpass">Quên mật khẩu</a></li>
      <li><a href="/users/logout">Thoát</a></li>
    `
    res.render('shop', {accountLi: data})
  } else {
    res.render('shop', {accountLi: data})
  }
})

router.get('/changepass', function(req, res) {
  let data = `
    <li><a href="/login">Đăng nhập</a></li>
    <li><a href="/forgotpass">Quên mật khẩu</a></li>
    <li><a href="/signup">Đăng ký</a></li>
  `
  if (req.session.daDangNhap) {
    data = `
      <li><a href="/changepass">Đổi mật khẩu</a></li>
      <li><a href="/forgotpass">Quên mật khẩu</a></li>
      <li><a href="/users/logout">Thoát</a></li>
    `
    res.render("changePass",{un:req.session.username, accountLi: data});
  }
  else {     
      req.session.back="/changepass";
      res.redirect("/login");
  }
});

router.post('/changepass', function(req, res) {
  var sess = req.session;
  let email = req.body.email;
  let p = req.body.password;
  let sql = 'SELECT * FROM users WHERE email = ?';
  if(sess.email == email) {
    db.query(sql, [email] , (err, rows) => {
        let user = rows[0];      
        let pass_fromdb = user.password;        
        const bcrypt = require("bcrypt");        
        var kq = bcrypt.compareSync(p, pass_fromdb);
        if (kq){ 
          data = `
            <li><a href="/changepass">Đổi mật khẩu</a></li>
            <li><a href="/forgotpass">Quên mật khẩu</a></li>
            <li><a href="/users/logout">Thoát</a></li>
          `
          res.render("newpass", {accountLi: data});
        }   
        else {
            console.log("Not OK");
            res.redirect("/changepass");
        }
    });   
  } else {
    res.redirect("/changepass");
  }
});

router.put('/changepass', function(req, res) {
  let data = req.body;
  var sess = req.session;
  const bcrypt = require("bcrypt");        
  var salt = bcrypt.genSaltSync(10);
  var pass_mahoa = bcrypt.hashSync(data.password, salt);
  data = {
      password: pass_mahoa
  }
  sql = "UPDATE users  SET ? WHERE id = ?"
  db.query(sql, [data, sess.idUser] ,(err) => {
      sess.daDangNhap = true;
      sess.email = sess.email;     
      sess.idUser = sess.idUser;
      if(err) throw err;
      res.redirect(303, "/");
  })
});

router.get('/forgotpass', function(req, res) {
  let data = `
    <li><a href="/login">Đăng nhập</a></li>
    <li><a href="/forgotpass">Quên mật khẩu</a></li>
    <li><a href="/signup">Đăng ký</a></li>
  `
  if (req.session.daDangNhap) {
    data = `
      <li><a href="/changepass">Đổi mật khẩu</a></li>
      <li><a href="/forgotpass">Quên mật khẩu</a></li>
      <li><a href="/users/logout">Thoát</a></li>
    `
    res.render("forgotpass",{accountLi: data});
  }
  else {     
      req.session.back="/forgotpass";
      res.redirect("/login");
  }
});

router.post('/forgotpass', function(req, res, next) {
  let email = req.body.email;
  var transporter =  nodemailer.createTransport({ // config mail server
      service: 'Gmail',
      auth: {
          user: 'gadota451@gmail.com',
          pass: 'quochung1511'
      }
  });
  var mainOptions = { // thiết lập đối tượng, nội dung gửi mail
      from: 'Nha sach FPoly',
      to: email,
      subject: 'Test Nodemailer',
      text: 'You recieved message from Nha Sach FPoly',
      html: '<p>Mật khẩu mới của bạn là YU6NZ3</p>'
  }
  transporter.sendMail(mainOptions, function(err, info){
      if (err) {
          console.log(err);
          res.redirect('/');
      } else {
          console.log('Message sent: ' +  info.response);
          res.redirect('/');
      }
  });
});

module.exports = router;
