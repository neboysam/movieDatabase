<?php

use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

/**
 * Class MoviesController
 * @mixin
 */
class UsersController extends Controller
{
  /**
   * MoviesController constructor
   */
  public function __construct()
  {
    parent::__construct();
    $this->usersModel = new UsersModel();

    self::$_twig = parent::getTwig();
  }

    public function register() {
    // Check for POST
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
      // Process form

      // Sanitize POST data
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

      // Init data
      $data = [
        'name' => trim($_POST['name']),
        'email' => trim($_POST['email']),
        'password' => trim($_POST['password']),
        'confirm_password' => trim($_POST['confirm_password']),
        'name_err' => '',
        'email_err' => '',
        'password_err' => '',
        'confirm_password_err' => ''
      ];

      // Validate Email
      if(empty($data['email'])){
        $data['email_err'] = 'Please enter email';
      }
      // } else {
      //   // Check email
      //   if($this->model->findUserByEmail($data['email'])){
      //     $data['email_err'] = 'Email is already taken';
      //   }
      // }

      // Validate Name
      if(empty($data['name'])){
        $data['name_err'] = 'Please enter name';
      }

      // Validate Password
      if(empty($data['password'])){
        $data['password_err'] = 'Please enter password';
      } elseif(strlen($data['password']) < 6){
        $data['password_err'] = 'Password must be at least 6 characters';
      }

      // Validate Confirm Password
      if(empty($data['confirm_password'])){
        $data['confirm_password_err'] = 'Please confirm password';
      } else {
        if($data['password'] != $data['confirm_password']){
          $data['confirm_password_err'] = 'Passwords do not match';
        }
      }

      // Make sure errors are empty
      if(empty($data['email_err']) && empty($data['name_err']) && empty($data['password_err']) && empty($data['confirm_password_err'])){
        // Validated
        
        // Hash Password
        $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);

        // Register User
        if($this->usersModel->registerData($data)){
          header('Location: login');
        } else {
          die('Something went wrong');
        }

      } else {
        // Load view with errors
        // $this->view('users/register', $data);
        $pageTwig = 'Admin/showRegisterForm.html.twig';
        $template = self::$_twig->load($pageTwig);
        echo $template->render(["data" => $data]);
      }

    } else {
      // Init data
      $data = [
        'name' => '',
        'email' => '',
        'password' => '',
        'confirm_password' => '',
        'name_err' => '',
        'email_err' => '',
        'password_err' => '',
        'confirm_password_err' => ''
      ];

      // Load view
      // $this->view('users/register', $data);
      $pageTwig = 'Admin/showRegisterForm.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render(["data" => $data]);
    }
  }

  public function login() {
    // Check for POST
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
      // Process form

      // Sanitize POST data
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

      // Init data
      $data = [
        'email' => trim($_POST['email']),
        'password' => trim($_POST['password']),
        'email_err' => '',
        'password_err' => '',
        ];

      // Validate Email
      if(empty($data['email'])){
        $data['email_err'] = 'Please enter email';
      }
      // } else {
      //   // Check email
      //   if($this->model->findUserByEmail($data['email'])){
      //     $data['email_err'] = 'Email is already taken';
      //   }
      // }

      // Validate Password
      if(empty($data['password'])){
        $data['password_err'] = 'Please enter password';
      } elseif(strlen($data['password']) < 6){
        $data['password_err'] = 'Password must be at least 6 characters';
      }

      // Make sure errors are empty
      if(empty($data['email_err']) && empty($data['password_err'])){
        // Validated
        
        // Check and set logged in user
        $loggedInUser = $this->usersModel->login($data['email'], $data['password']);

        if($loggedInUser){
          // Create Session
          $this->createUserSession($loggedInUser);
        } else {
          $data['password_err'] = 'Password incorrect';

          $pageTwig = 'Admin/login.html.twig';
          $template = self::$_twig->load($pageTwig);
          echo $template->render(["data" => $data]);
        }
    
    } else {
        // Load view with errors
        // $this->view('users/register', $data);
        $pageTwig = 'Admin/login.html.twig';
        $template = self::$_twig->load($pageTwig);
        echo $template->render(["data" => $data]);
      }
    }
     else {
      // Init data
      $data = [
        'name' => '',
        'email' => '',
        'password' => '',
        'confirm_password' => '',
        'name_err' => '',
        'email_err' => '',
        'password_err' => '',
        'confirm_password_err' => ''
      ];

      // Load view
      // $this->view('users/register', $data);
      $pageTwig = 'Admin/login.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render(["data" => $data]);
    }
  }

  public function createUserSession($user){
    $_SESSION['user_id'] = $user->id;
    $_SESSION['user_email'] = $user->email;
    $_SESSION['user_name'] = $user->name;
    header('Location: admin');
  }

  public function logout(){
    unset($_SESSION['user_id']);
    unset($_SESSION['user_email']);
    unset($_SESSION['user_name']);
    session_destroy();
    header('Location: login');
  }

  public function isLoggedIn(){
    if(isset($_SESSION['user_id'])){
      return true;
    } else {
      return false;
    }
  }
}