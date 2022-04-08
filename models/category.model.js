const db = require('./database');

function selectAllCate(req, res, next) {
    const sql = `Select * from loai`;
    db.query(sql, (err, allCate) => {
        if (err) throw err;
        req.data = allCate;
        next();
    });
}

function detailCate(req, res, next) {
    let id = req.params.id;      
    let sql = 'SELECT * FROM loai WHERE id = ?'    
    db.query(sql, id, (err, detail) => {
        if (err) throw err;
        req.data = detail;
        next();
    }); 
}

function addCate(req, res, next) {
    let data = req.body;
    let sql = 'INSERT INTO loai SET ?';
    db.query(sql, data, (err, d) => {
        if (err) throw err;
        next();
    });
}

function updateCate(req, res, next) {
    let data = req.body;
    let id = req.params.id;
    let sql = 'UPDATE loai SET ? WHERE id = ?';
    db.query(sql, [data, id], (err, d) => {
        if (err) throw err;
        next();
    });
}

function deleteCate(req, res, next) {
    let id = req.params.id;
    let sql = 'DELETE FROM loai WHERE id = ?'
    db.query(sql, id , (err, d) => {
        if (err) throw err;
        next();
    });
}

module.exports = {
    selectAllCate,
    detailCate,
    addCate,
    updateCate,
    deleteCate
}