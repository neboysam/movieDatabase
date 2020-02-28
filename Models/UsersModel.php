<?php

class UsersModel extends Model {
    public function __construct()
    {
      $this->pdo = parent::getPdo();
    }

    // Register user
    public function registerData($data){
      $sql = "INSERT INTO users (username, user_email, user_password) VALUES (:name, :email, :password)";
      $req = self::$_pdo->prepare($sql);
      return $req->execute(['name' => $data['name'], 'email' => $data['email'], 'password' => $data['password']]);
    }

    // Login User
    public function login($email){
      // $this->db->query('SELECT * FROM users WHERE email = :email');
      // $this->db->bind(':email', $email);
      // $row = $this->db->single();

      $req = $this->pdo->prepare('SELECT * FROM users WHERE user_email = ?');
      $req->execute([$email]);
      return $req->fetch();
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
    // public function resultSet(){
    //   $this->execute();
    //   return $this->stmt->fetchAll(PDO::FETCH_OBJ);
    // }

    // Get row count
    public function rowCount(){
      return $this->req->rowCount();
    }
  }