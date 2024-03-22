const express = require('express');
const router = express.Router();
const {protect} = require('../middlewares/authMiddleware');

const {register, login, getUsers} = require('../controllers/UserController');

router.post('/register', register);
router.post('/login', login);

router.get('/me', protect, getUsers);

module.exports = router;