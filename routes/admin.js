var express = require('express');
var router = express.Router();
var db=require('../models/database'); 

router.get('/', (req, res) => {
    res.render('admin/index');
})

module.exports = router;
