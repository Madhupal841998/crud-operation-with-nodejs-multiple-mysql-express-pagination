const mysql = require('mysql');

const con = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"sales"//while creating database keep it blank.After Database created add database name.
});

/*
con.connect(function(error){
    if(error) throw error;
    
    con.query("select * from product",function(error,result){
        if(error) throw error;
        console.log(result);
    });
});
*/

//app.listen(2000);
module.exports = con;
