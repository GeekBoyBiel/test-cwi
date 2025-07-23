const express = require('express');
const cors = require('cors');
const path = require('path');
const fs = require('fs').promises;

const app = express();
const port = process.env.NODE_PORT || 3001;

app.use(cors());
app.use(express.json());

app.get('/', async (req, res) => {
  try {
    const dataPath = path.join(__dirname, 'data', 'employees.json');
    const data = await fs.readFile(dataPath, 'utf-8');
    const json = JSON.parse(data);
    res.json(json);
  } catch (error) {
    console.error('Error reading JSON:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.listen(port, () => {
  console.log(`Node microservice running on port ${port}`);
});
