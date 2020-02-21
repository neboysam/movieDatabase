<?php

class UsersModel extends Model {
    public function __construct()
    {
      $this->pdo = parent::getPdo();
    }

    // Register user
    public function register($data){
      $this->pdo->query('INSERT INTO users (username, user_email, user_password) VALUES(:username, :user_email, :user_password)');
      // Bind values
      $this->pdo->bind(':username', $data['name']);
      $this->pdo->bind(':user_email', $data['email']);
      $this->pdo->bind(':user_password', $data['password']);

      // Execute
      if($this->pdo->execute()){
        return true;
      } else {
        return false;
      }
    }

    // Find user by email
    public function findUserByEmail($email){
      $req = $this->pdo->prepare(
        'SELECT * FROM users WHERE user_email = ?'
      );
      $req->execute([$email]);
      return $req->fetch();

      // Check row
      if($this->pdo->rowCount() > 0){
        return true;
      } else {
        return false;
      }
    }

    // Get result set as array of objects
    public function resultSet(){
      $this->execute();
      return $this->stmt->fetchAll(PDO::FETCH_OBJ);
    }

    // Get row count
    public function rowCount(){
      return $this->req->rowCount();
    }

  }