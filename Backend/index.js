var mysql = require('mysql2');
var express = require('express');
var dbConnection = require('./database.js');;
var routes = require('./routes.js');
const cors = require("cors");


var app = express();
app.use(cors({ origin: true, credentials: true }));

const port = process.env.PORT || 3000;
app.use(express.json());

app.use('/lang',routes);
app.listen(port, function () {
    //connect to mongoose
    console.log('Restful API is running on PORT '+port);
    dbConnection.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
      });
  });
  

  

