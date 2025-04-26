const db = require('../db/database');

function addExpense(userId, amount, category, date, notes, callback) {
  const sql = 'INSERT INTO EXPENSE (USER_ID, AMOUNT, CATEGORY, DATE, NOTES) VALUES (?, ?, ?, ?, ?)';
  db.run(sql, [userId, amount, category, date, notes], callback);
}

function getExpenses(userId, callback) {
  const sql = 'SELECT * FROM EXPENSE WHERE USER_ID = ?';
  db.all(sql, [userId], callback);
}

module.exports = { addExpense, getExpenses };
