const express = require('express');
const app = express();

const PORT = process.env.PORT || 8000;

app.get('/health', (req, res) => {
  res.json({ status: 'ok', service: 'client-backend', env: 'dev' });
});

app.get('/version', (req, res) => {
  res.json({
    version: '2.0.0',
    message: 'client backend v2',
    deployedAt: new Date().toISOString()
  });
});

app.get('/', (req, res) => {
  res.send('client backend v2');
});

app.listen(PORT, () => console.log(`Listening on ${PORT}`));
