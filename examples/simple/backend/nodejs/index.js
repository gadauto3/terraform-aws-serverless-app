const serverless = require('serverless-http');
const express = require('express');

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get('/api/info', (req, res) => {
    res.send({ application: 'sample-app', version: '1', time: (new Date()).toLocaleTimeString() });
});

app.post('/api/v1/getback', (req, res) => {
    res.send({ ...req.body });
});

app.post('/api/friend/friendModel', (req, res) => {
    res.send({ ...req.body });
});

app.post('/api/friend/friendModel/_id*', (req, res) => {
    res.send({ ...req.body });
});

// app.listen(3000, () => console.log(`Listening on: 3000`));
module.exports.handler = serverless(app);
