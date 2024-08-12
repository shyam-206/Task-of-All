const sql  = require("mssql");

var config = {
    user: "sa", // Database username
    password: "sit@123", // Database password
    server: "192.168.1.117", // Server IP address
    // port : 12345,
    database: "shyam", // Database name

    "options": {
        "encrypt":false // Disable encryption
    }
}

const pool = new sql.ConnectionPool(config)

pool.connect().then(pool => {
    console.log('Connect to sql server');

    const query = 'SELECT * FROM table1';

    return pool.request().query(query)
}).then(res => {
    console.log(res.recordset)
    
    pool.close()
}).catch(err => {
    console.error(err)

    pool.close()
})