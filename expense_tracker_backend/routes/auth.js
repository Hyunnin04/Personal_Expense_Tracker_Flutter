const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { createUser, findUserByEmail } = require('../models/userModel');
require('dotenv').config();

const router = express.Router();

router.post('/signup', async (req, res) => {
  const { username, email, password } = req.body;
  const hashedPass = await bcrypt.hash(password, 10);

  createUser(username, email, hashedPass, function(err) {
    if (err) return res.status(400).json({ message: 'User already exists!' });

    res.status(201).json({ message: 'User created successfully' });
  });
});

router.post('/login', (req, res) => {
  const { email, password } = req.body;

  findUserByEmail(email, async function(err, user) {
    if (err || !user) return res.status(400).json({ message: 'User not found' });

    const match = await bcrypt.compare(password, user.HASHED_PASS);

    if (!match) return res.status(400).json({ message: 'Invalid credentials' });

    const token = jwt.sign({ id: user.ID, email: user.EMAIL }, process.env.JWT_SECRET, { expiresIn: '1d' });

    res.json({ token });
  });
});

module.exports = router;
