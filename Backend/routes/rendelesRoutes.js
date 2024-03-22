const express = require('express');
const router = express.Router();

const { rendelesek, getRendelesek , cangeStatusz} = require('../controllers/rendelesController')

router.post('/rendelesek', rendelesek);
router.get('/getRendelesek', getRendelesek);
router.post("/change", cangeStatusz);
module.exports = router;