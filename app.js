const express = require('express');
const path = require('path');

const PORT = 80;
const HOST = '0.0.0.0';

const app = express();

app.use(express.static(path.join(__dirname, '/public')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '/views/index.html'));
});

app.listen(PORT, HOST, () => {
  console.log(`Running on https://${HOST}:${PORT}`);
});
