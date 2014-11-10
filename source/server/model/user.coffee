mongoose = require 'mongoose'
bcrypt = require 'bcrypt'
SALT_WORK_FACTOR = 10


User = new mongoose.Schema
  username:
    type: String
    required: true
    index:
      unique: true
  password:
    type: String
    required: true

User.pre 'save', (next) ->
  user = this
  if  !user.isModified 'password' then return next()

  @encrypt_password user.password, (hash, err) ->
    if !err then user.password = hash
    next err

User.encrypt_password = (text, callback) ->
  bcrypt.genSalt SALT_WORK_FACTOR, (err, salt) ->
    if err then return callback undefined, err

    bcrypt.hash text, salt, (err, hash) ->
      if err then return callback undefined, err
      callback hash


module.exports = mongoose.model 'User', User
