var express = require('express');
var router = express.Router();
var db=require('../models/database');
const Category = require('../models/category.model');
const Products = require('../models/products.model');

// Restful API category 
router.get('/category', Category.selectAllCate ,function(req, res, next) {
    res.json(req.data);
});

router.post('/category', Category.addCate, function(req, res, next) {
    res.json({thongbao:"Đã chèn xong loại"});
});
router.get('/category/:id', Category.detailCate, function(req, res, next) {
    res.json(req.data[0]);
});
router.put('/category/:id', Category.updateCate, function(req, res, next) {
    res.json({thongbao: 'Đã cập nhật loại'});
});
router.delete('/category/:id', Category.deleteCate, function(req, res) { 
    res.json({thongbao: 'Đã xóa thành công'});
});

//Restfull API products
router.get('/products', Products.selectAllPro ,function(req, res) {
    res.json(req.data)
});

router.post('/products', Products.addPro, function(req, res, next) {
    res.json({thongbao:"Đã chèn xong sách"});
});

router.get('/products/:id', Products.detailPro, function(req, res, next) {
    res.json(req.data[0])
});

router.put('/products/:id', Products.updatePro, function(req, res, next) {
    res.json({thongbao: 'Đã cập nhật sách'});
});

router.delete('/products/:id', Products.deletePro, function(req, res) { 
    res.json({thongbao: 'Đã xóa thành công'});
});

router.get('/bestseller', Products.bestSellerPro ,function(req, res) {
    res.json(req.data)
});

router.get('/new', Products.newPro ,function(req, res) {
    res.json(req.data)
});

router.get('/bestview', Products.bestView ,function(req, res) {
    res.json(req.data)
});
  
module.exports = router;
