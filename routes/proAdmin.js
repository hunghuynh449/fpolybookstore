var express = require("express");
var router = express.Router();
const db = require("../models/database");

//import formidable module
const formidable = require("formidable");
const fs = require("fs");

/* GET home page. */
router.get("/", function (req, res, next) {
  const sql = `Select * from sach`;
  db.query(sql, (err, data) => {
    res.render("admin/products", { data: data });
  });
});

router.get("/addnew", (req, res) => {
  const sql = `Select * from loai`;
  db.query(sql, (err, item) => {
    if (err) throw err;
    res.render("admin/productAdd", { item: item });
  });
});

router.post("/addnew", (req, res) => {
  let sql = "insert into sach SET ?";
  var form = new formidable.IncomingForm();
  form.parse(req, (err, fields, files) => {
    let name = fields.nameBook;
    let price = fields.priceBook;
    let pathFile = files.imgBook.filepath;
    let imgname = files.imgBook.originalFilename;
    let idCate = fields.idCate;
    let status = fields.status;
    let detail = fields.detailBook;
    let destPath = "public/images/" + imgname;
    fs.copyFile(pathFile, destPath, (err) => {
      if (err) throw err;
      fs.unlink(pathFile, () => {
        console.log("Đã xóa file tạm");
      });
    });
    let data = {
      tenSach: name,
      gia: price,
      moTa: detail,
      urlHinh: "images/" + imgname,
      idLoai: idCate,
      anHien: status,
    };
    db.query(sql, data, (err, item) => {
      if (err) throw err;
      res.redirect("/admin/products/");
    });
  });
});

router.get("/edit/:id", (req, res) => {
  const id = req.params.id;
  const sqlCate = `Select * from loai`;
  let sqlProduct = `Select * from sach WHERE id=${id}`;
  db.query(sqlCate, (err, item) => {
    if (err) throw err;
    db.query(sqlProduct, (err, data) => {
      res.render("admin/productEdit", { data: data[0], item: item });
    });
  });
});

router.post("/update", (req, res) => {
  var form = new formidable.IncomingForm();
  form.parse(req, (err, fields, files) => {
    let id = fields.idBook;
    let name = fields.nameBook;
    let price = fields.priceBook;
    let imgname = files.imgBook.originalFilename;
    let idCate = fields.idCate;
    let status = fields.status;
    let detail = fields.detailBook;
    db.query(
      `update sach SET tenSach=?, gia=?, moTa=?, idLoai=?, anHien=? WHERE id=?`,
      [name, price, detail, idCate, status, id],
      (err, item) => {
        if (item.affectedRows == 0) console.log(`Không có id ${id} để sửa`);
        res.redirect("/admin/products/");
      }
    );
  });
});

router.get("/delete/:id", (req, res) => {
  const id = req.params.id;
  let sql = `DELETE FROM sach WHERE id = ?`;
  db.query(sql, [id], function (err, item) {
    if (item.affectedRows == 0) {
      console.log(`Không có id ${id} để xóa`);
    }
    res.redirect("/admin/products/");
  });
});

module.exports = router;
