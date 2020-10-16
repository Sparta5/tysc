var express = require('express');
var router = express.Router('../pool.js');

/* GET home page. */
router.get('/', function(req, res) {
  console.log('ok')
});

module.exports = router;
