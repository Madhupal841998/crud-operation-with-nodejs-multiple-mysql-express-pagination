const con = require("./connection");
const express = require('express');
const app = express();

var bodyParser = require('body-parser');
const { response } = require("express");
app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ extended: false }));

app.set('view engine', 'ejs');

//Create Database
app.get('/createDB',(req,res) =>{
    let sql = 'CREATE DATABASE sales';
    con.query(sql,(err,result) =>{
        res.send('Database Created');
    });
});
//create category table
app.get('/table1',(req,res) =>{
    let sql = 'CREATE TABLE category(`id` int(10) NOT NULL AUTO_INCREMENT, `categoryId` int(10) ,`categoryName` varchar(100) NOT NULL, PRIMARY KEY (`categoryId`) , KEY (`id`))';
    con.query(sql,(error,result) =>{
        if(error) throw error;
        res.send('category table Created');
    });
});
//create product table
app.get('/table2',(req,res) =>{
    let sql = 'CREATE TABLE product(`Id` INT(10) NOT NULL AUTO_INCREMENT, `productId` INT(10) NOT NULL, `productName` VARCHAR(100) NOT NULL, `fk_category_id` INT(10) NOT NULL, PRIMARY KEY(`Id`), CONSTRAINT `fk_category_id` FOREIGN KEY (fk_category_id) REFERENCES category (categoryId) ON DELETE CASCADE  ON UPDATE CASCADE)';

    con.query(sql,(error,result) =>{
        if(error) throw error;
        res.send('product table Created');
    });
});
const resultsPerPage = 10;


//Category table 

app.get('/table1insert', (req, res) => {
    res.sendFile(__dirname + '/registerCategory.html');
});

app.post('/table1insert', (req, res) => {
    var categoryName = req.body.categoryName;
    var categoryId = req.body.categoryId;
    var sql = "INSERT INTO category (categoryId,categoryName) VALUES ? ";

    var values = [
       [categoryId, categoryName]
        ];
    con.query(sql,[values], (error, result) => {   
        res.redirect('/category')     
       //  console.log(result.affectedRows);
    //res.send("Category insertion successfully "+categoryId);
    });
});

app.get('/category', (req, res) => {
    var sql = 'SELECT * FROM category';
    con.query(sql, (error, result) => {
        const numOfResults = result.length;
        const numberOfPages = Math.ceil(numOfResults / resultsPerPage);
        let page = req.query.page ? Number(req.query.page) : 1;
        if(page > numberOfPages){
            res.redirect('/category?page='+encodeURIComponent(numberOfPages));
        }else if(page < 1){
            res.redirect('/category?page='+encodeURIComponent('1'));
        }
        //Determine the SQL LIMIT starting number
        const startingLimit = (page - 1) * resultsPerPage;
        //Get the relevant number of POSTS for this starting page
        var sql = `SELECT * FROM category LIMIT ${startingLimit},${resultsPerPage}`;
        con.query(sql, (err, result)=>{
            let iterator = (page - 5) < 1 ? 1 : page - 5;
            let endingLink = (iterator + 9) <= numberOfPages ? (iterator + 9) : page + (numberOfPages - page);
            if(endingLink < (page + 4)){
                iterator -= (page + 4) - numberOfPages;
            }
            res.render(__dirname +'/category', { category: result, page, iterator, endingLink, numberOfPages});
        });
    });
});

//Delete Category

app.get('/delete-category', (req, res) => {

    var sql = "delete from category where categoryId=?";

    var categoryId = req.query.categoryId;

    con.query(sql, [categoryId], (error, result) => {
        if (error) throw error;
        //console.log(result);
        res.redirect('/category');
    });
});

//Update Category


app.get('/update-category', function (req, res) {
    var sql = "select * from category where categoryId= ? ";

    var categoryId = req.query.categoryId;

    con.query(sql, [categoryId], function (error, result) {
        if (error) console.log(error);
        res.render(__dirname + "/update-category", { category: result });
    });
});

app.post('/update-category', function (req, res) {
    var id = req.body.id;
    var categoryId = req.body.categoryId;
    var categoryName = req.body.categoryName;
    var sql = " UPDATE category set categoryId= ?, categoryName= ?  WHERE id= ? ";
    con.query(sql, [categoryId, categoryName, id], function (error, result) {
            res.redirect('/category');
        });
});



//Product


app.get('/', (req, res) => {
    res.sendFile(__dirname + '/registerProduct.html');
});

app.post('/', (req, res) => {
    var productId = req.body.productId;
    var productName = req.body.productName;
    var fk_category_id = req.body.fk_category_id;
    var sql = "INSERT INTO product(productId,productName,fk_category_id) VALUES ?";

    var values = [
        [productId, productName,fk_category_id]
    ];

    con.query(sql, [values], (error, result) => {
        if (error) throw error;
        res.redirect('/product');
        // console.log(result);
    //res.send("Registration successfully " + productId);
    });
});




app.get('/product', (req, res) => {
  //  var sql ='SELECT  product.productId, product.productName, product.fk_category_id, category.categoryName FROM product INNER JOIN category ON product.fk_category_id=category.categoryId';
    var sql = 'SELECT * FROM product';
    con.query(sql, (error, result) => {
            const numOfResults = result.length;
        const numberOfPages = Math.ceil(numOfResults / resultsPerPage);
        let page = req.query.page ? Number(req.query.page) : 1;
        if(page > numberOfPages){
            res.redirect('/product?page='+encodeURIComponent(numberOfPages));
        }else if(page < 1){
            res.redirect('/product?page='+encodeURIComponent('1'));
        }
        //Determine the SQL LIMIT starting number
        const startingLimit = (page - 1) * resultsPerPage;
        //Get the relevant number of POSTS for this starting page
        var sql = `SELECT  product.productId, product.productName, product.fk_category_id, category.categoryName FROM product INNER JOIN category ON product.fk_category_id=category.categoryId ORDER BY productId LIMIT ${startingLimit},${resultsPerPage}`;
        con.query(sql, (err, result)=>{
            let iterator = (page - 5) < 1 ? 1 : page - 5;
            let endingLink = (iterator + 9) <= numberOfPages ? (iterator + 9) : page + (numberOfPages - page);
            if(endingLink < (page + 4)){
                iterator -= (page + 4) - numberOfPages;
            }
            res.render(__dirname +'/product', { product: result, page, iterator, endingLink, numberOfPages});
        });
    });
});

/*
app.get('/product', (req, res) => {


    var sql = "select * from product";

    con.query(sql, (error, result) => {
        if (error)
            throw error;
        // console.log(result);
        res.render(__dirname + "/product.ejs", { product: result });

    });
});
*/

app.get('/delete-product', (req, res) => {

    var sql = "delete from product where productId=?";

    var productId = req.query.productId;

    con.query(sql, [productId], (error, result) => {
        if (error) throw error;
        //console.log(result);
        res.redirect('/product');
    });
});

app.get('/update-product', function (req, res) {
    var sql = "select * from product where productId=?";

    var productId = req.query.productId;

    con.query(sql, [productId], function (error, result) {
        if (error) console.log(error);
        res.render(__dirname + "/update-product", { product: result });
    });
});

app.post('/update-product', function (req, res) {
    var Id = req.body.Id;
    var productId = req.body.productId;
    var productName = req.body.productName;
    var fk_category_id = req.body.fk_category_id;
    var sql = " UPDATE product set productId= ?, productName= ?  , fk_category_id= ? WHERE Id= ? ";

    con.query(sql, [productId, productName,fk_category_id,Id], (result) => {
        res.redirect('/product');
    });
});

/*con.connect(function(error){
    if(error) throw error;
    
    con.query("select * from product",function(error,result){
        if(error) throw error;
        console.log(result);

    });
});
*/
app.listen(2000);
