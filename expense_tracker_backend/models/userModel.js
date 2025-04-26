const db = require('../db/database');

function createUser(username, email, hashedPassword, callback) {
  const sql = 'INSERT INTO USERS (USERNAME, EMAIL, HASHED_PASS) VALUES (?, ?, ?)';
  db.run(sql, [username, email, hashedPassword], callback);
}

function findUserByEmail(email, callback) {
  const sql = 'SELECT * FROM USERS WHERE EMAIL = ?';
  db.get(sql, [email], callback);
}

module.exports = { createUser, findUserByEmail };
