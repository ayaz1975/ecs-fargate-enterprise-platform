const express = require('express');
const app = express();

const PORT = process.env.PORT || 8000;

app.get('/health', (req, res) => {
  res.json({ status: 'ok', service: 'client-backend' });
});

app.get('/version', (req, res) => {
  res.json({
    version: '1.0.0',
    deployedAt: new Date().toISOString()
  });
});

app.listen(PORT, () => {
  console.log(`API running on port ${PORT}`);
});
