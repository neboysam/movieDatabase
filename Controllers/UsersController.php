<?php
//include_once ob_start();

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
    $this->model = new UsersModel();

    self::$_twig = parent::getTwig();
  }

    // public function index() {
    //   $allMovies = $this->model->getAllMovies();
    //   $pageTwig = 'Movies/allMovies.html.twig';
    //   $template = self::$_twig->load($pageTwig);
    //   echo $template->render(["allMovies" => $allMovies]);
    // }

    // public function showMovie(int $id) {
    //   $actorsDetails = $this->model->getActorsDetails($id);
    //   $movieDetails = $this->model->getMovieDetails($id);
    //   $pageTwig = 'Movies/showMovie.html.twig';
    //   //self::$_twig->addGlobal('actor', $result);
    //   $template = self::$_twig->load($pageTwig);
    //   echo $template->render(["actorsDetails" => $actorsDetails, "movieDetails" => $movieDetails]);
    // }

    // public function addMovie() {
    //   // Fetch all directors and genres from the database into two dropdown lists on the Add Movie page
    //   $directors = $this->model->getAllDirectors();
    //   $genres = $this->model->getAllGenres();
    //   // Display the input form on the Add Movie page
    //   $pageTwig = 'Movies/addMovie.html.twig';
    //   $template = self::$_twig->load($pageTwig);
    //   echo $template->render(["directors" => $directors, "genres" => $genres]);
    // }

    // public function insertNewMovie() {
    //   $titre = $_POST['titre'];
    //   $annee_sortie = $_POST['annee_sortie'];
    //   $affiche = $_FILES['affiche']['name'];
    //   $affiche_temp = $_FILES['affiche']['tmp_name'];
    //   $synopsis = $_POST['synopsis'];
    //   $genre = $_POST['genre'];
    //   $director = $_POST['director'];

    //   move_uploaded_file($affiche_temp, "../Uploads/posters/$affiche");

    //   $this->model->insertMovie($titre, $annee_sortie, $affiche, $synopsis, $genre, $director);

    //   // if($this->model->insertMovie($titre, $annee_sortie, $synopsis, $genre, $director))
    //   // {
    //   //   echo "ok";
    //   // } else {
    //   //   echo "pas ok";
    //   //   echo $_POST['director'] . '<br>';
    //   //   echo $_POST['titre'] . '<br>';
    //   //   echo $_POST['annee_sortie'] . '<br>';
    //   //   echo $_POST['synopsis'] . '<br>';
    //   //   echo $_POST['genre'];
    //   // }

    //   header("Location: http://localhost/ACS-MovieRating/movies");
    // }

    // public function getAllMovies() {
    //   $getAllMovies = $this->model->getAllMovies();
    //   $pageTwig = 'Movies/getAllMovies.html.twig';
    //   $template = self::$_twig->load($pageTwig);
    //   echo $template->render(["getAllMovies" => $getAllMovies]);
    // }

    // // Function to fetch all the data from the DB into the Update Movie form on the Update Movie page
    // public function getMovie($id_film) {
    //   $movieDetails = $this->model->getMovieDetails($id_film);
    //   $director = $this->model->getDirectorDetails($id_film);
    //   $directors = $this->model->getAllOtherDirectors($id_film);

    //   $genre = $this->model->getGenre($id_film);
    //   $genres = $this->model->getAllOtherGenres($id_film);

    //   $pageTwig = 'Movies/getMovie.html.twig';
    //   $template = self::$_twig->load($pageTwig);
    //   echo $template->render(["movieDetails" => $movieDetails, 'director' => $director, 'directors' => $directors, 'genre' => $genre, 'genres' => $genres]);
    // }

    // public function updateMovie($id_film) {
    //   $titre = $_POST['titre'];
    //   $annee_sortie = $_POST['annee_sortie'];
    //   $affiche = $_FILES['affiche']['name'];
    //   $affiche_temp = $_FILES['affiche']['tmp_name'];
    //   $synopsis = $_POST['synopsis'];
    //   $genre = $_POST['genre'];
    //   $director = $_POST['director'];

    //   move_uploaded_file($affiche_temp, "../Uploads/posters/$affiche");

    //   if($this->model->updateMovie($id_film, $titre, $annee_sortie, $affiche, $synopsis, $genre, $director)) {
    //     echo "ok";
    //   } else {
    //     echo "not ok";
    //   };

    //   // header("Location: http://localhost/ACS-MovieRating/movies");
    // }

    // public function showRegisterForm() {
    //   $data = [
    //     'name' => '',
    //     'email' => '',
    //     'password' => '',
    //     'confirm_password' => '',
    //     'name_err' => '',
    //     'email_err' => '',
    //     'password_err' => '',
    //     'confirm_password_err' => ''
    //   ];
    //     // $allMovies = $this->model->getAllMovies();
    //     $pageTwig = 'Admin/showRegisterForm.html.twig';
    //     $template = self::$_twig->load($pageTwig);
    //     echo $template->render(["data" => $data]);
    // }

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
      } else {
        // Check email
        if($this->model->findUserByEmail($data['email'])){
          $data['email_err'] = 'Email is already taken';
        }
      }

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
        if($this->model->register($data)){
          redirect('/login');
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
}