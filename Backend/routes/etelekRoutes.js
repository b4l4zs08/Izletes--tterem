const express = require('express');
const router = express.Router();

const { getEtelek,etelek,modositas} = require('../controllers/etelekController')
router.post('/etelek', etelek);

router.get('/getEtelek',  getEtelek);
router.patch('/modosit/:etelid', modositas);
module.exports = router;