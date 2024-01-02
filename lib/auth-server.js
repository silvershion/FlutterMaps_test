// auth-server.js

const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

const app = express();
const secretKey = 'your-secret-key';

app.use(bodyParser.json());

app.post('/login', (req, res) => {
  // Perform user authentication (check credentials, etc.)
  const { username, password } = req.body;

  // Replace this with your actual authentication logic
  if (username === 'example' && password === 'password') {
    // Generate a JWT
    const token = jwt.sign({ username }, secretKey, { expiresIn: '1h' });

    res.json({ token });
  } else {
    res.status(401).json({ message: 'Invalid credentials' });
  }
});

app.listen(3001, () => {
  console.log('Authentication server is running on port 3001');
});
