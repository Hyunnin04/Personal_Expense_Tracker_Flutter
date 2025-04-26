const express = require('express');
const { addExpense, getExpenses } = require('../models/expenseModel');
const authenticateToken = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/', authenticateToken, (req, res) => {
  const { amount, category, date, notes } = req.body;
  const userId = req.user.id;

  addExpense(userId, amount, category, date, notes, function(err) {
    if (err) return res.status(500).json({ message: 'Failed to add expense' });

    res.status(201).json({ message: 'Expense added' });
  });
});

router.get('/', authenticateToken, (req, res) => {
  const userId = req.user.id;

  getExpenses(userId, function(err, expenses) {
    if (err) return res.status(500).json({ message: 'Failed to fetch expenses' });

    res.json(expenses);
  });
});

module.exports = router;
