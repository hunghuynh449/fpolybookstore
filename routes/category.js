var express = require('express');
var router = express.Router();
var db=require('../models/database'); 

router.get('/:cateId', (req, res) => {
    let id = req.params.cateId;
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
        res.render('shopCate', { id: id, accountLi: data })
    } else {
        res.render('shopCate', { id: id, accountLi: data })
    }
})

module.exports = router;
