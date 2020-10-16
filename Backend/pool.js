/**连接池**/
const mysql = require('mysql')

const pool = {
  host: '127.0.0.1',
  port: '3306',
  user: 'root',
  password: '',
  database: 'tysc',
  connectTimeout:10
}

module.exports = pool