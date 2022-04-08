var express = require('express');
var router = express.Router();
const db = require('../models/database');
const Category = require('../models/category.model');

/* GET home page. */
router.get('/', Category.selectAllCate ,function(req, res, next) {
    res.render('admin/category', { data: req.data});
});


router.post('/addnew', (req, res) => {
    let name = req.body.nameCategory;
    let rate = req.body.rateCategory;
    let status = req.body.status;
    let data = {
        tenLoai: name,
        thuTu: rate,
        anHien: status
    }
    db.query('insert into loai SET ?', data, (err, item) =>{
        res.redirect('/admin/category/')
    })
})

router.get('/edit/:id', (req, res) => {
    const id = req.params.id;
    let sql = `Select * from loai WHERE id=${id}`;
    db.query(sql, (err, item) => {
        res.render("admin/categoryEdit", {item: item[0]});
    })
})

router.post('/update', (req, res) => {
    let id = req.body.idCategory;
    let name = req.body.nameCategory;
    let rate = req.body.rateCategory;
    let status = req.body.status;
    db.query(`update loai SET tenLoai=?, thuTu=?, anHien=? WHERE id=?`, [name, rate, status, id], (err, item) =>{
        if(item.affectedRows == 0) console.log(`Không có id loai ${id} để thêm`);;
        res.redirect('/admin/category/')
    })
})

router.get('/delete/:id', (req, res) => {
    const id = req.params.id;
    let sql= `DELETE FROM loai WHERE id = ?`;
    db.query(sql, [id], function(err, item) {    
        if (item.affectedRows==0) {
            console.log(`Không có loại ${id} để xóa`); 
        }
        res.redirect('/admin/category/');
    })
})

module.exports = router;
