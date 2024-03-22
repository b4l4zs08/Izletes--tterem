const express = require('express');
const cors = require('cors');

const app = express();
const PORT = 8000;

app.use(express.json());
app.use(cors());
app.use('/user', require('./routes/userRoutes'));
app.use('/etel',require('./routes/etelekRoutes'));
app.use('/rendeles', require('./routes/rendelesRoutes'));
app.listen(PORT, () => {
    console.log(`listening on ${PORT}`);
});

app.get('/', (req, res) => {
    res.json({message: 'Hello'});
});





