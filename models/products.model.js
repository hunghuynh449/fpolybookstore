const db = require('./database');

function selectAllPro(req, res, next) {
    const sql = `Select * from sach`;
    db.query(sql, (err, allPro) => {
        if (err) throw err;
        req.data = allPro;
        next();
    });
}

function bestSellerPro(req, res, next) {
    const sql = `Select * from sach ORDER BY luotMua DESC limit 4`;
    db.query(sql, (err, allPro) => {
        if (err) throw err;
        req.data = allPro;
        next();
    });
}

function newPro(req, res, next) {
    const sql = `Select * from sach ORDER BY capNhat DESC`;
    db.query(sql, (err, allPro) => {
        if (err) throw err;
        req.data = allPro;
        next();
    });
}

function bestView(req, res, next) {
    const sql = `Select * from sach ORDER BY luotXem DESC limit 4`;
    db.query(sql, (err, allPro) => {
        if (err) throw err;
        req.data = allPro;
        next();
    });
}

function detailPro(req, res, next) {
    let id = req.params.id;      
    let sql = 'SELECT * FROM sach WHERE id = ?'    
    db.query(sql, id, (err, detail) => {
        if (err) throw err;
        req.data = detail;
        next();
    }); 
}

function addPro(req, res, next) {
    let data = req.body;
    let sql = 'INSERT INTO sach SET ?';
    db.query(sql, data, (err, d) => {
        if (err) throw err;
        next();
    });
}

function updatePro(req, res, next) {
    let data = req.body;
    let id = req.params.id;
    let sql = 'UPDATE sach SET ? WHERE id = ?';
    db.query(sql, [data, id], (err, d) => {
        if (err) throw err;
        next();
    });
}

function deletePro(req, res, next) {
    let id = req.params.id;
    let sql = 'DELETE FROM sach WHERE id = ?'
    db.query(sql, id , (err, d) => {
        if (err) throw err;
        next();
    });
}

module.exports = {
    selectAllPro,
    bestSellerPro,
    newPro,
    bestView,
    detailPro,
    addPro,
    updatePro,
    deletePro
}