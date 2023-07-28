const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send("A simple Web Application for Medcloud's test!");
});

const PORT = process.env.PORT || 80;
app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}...`);
});