const express = require('express');
const app = express();

app.get('/', (req, res) => {
    try {
        res.send("A simple Web Application for Medcloud's test! :)");

    } catch (error) {
        console.error(JSON.stringify(error));
        res.status(500);
        res.send(error.message);
    }
});

app.get('/healthcheck', (req, res) => {
    try{
        res.sendStatus(200);
        res.sendStatus(204);
    }catch(error){
        res.sendStatus(500);
    }
})

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}...`);
});

