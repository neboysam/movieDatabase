<?php

use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;


/**
 * Class MoviesController
 * @mixin
 */
class ArtistsController extends Controller
{
  /**
   * MoviesController constructor
   */
  public function __construct()
  {
    parent::__construct();
    $this->model = new ArtistsModel();

    self::$_twig = parent::getTwig();
  }

  // public function test() // this is to test calling another class from this class
  // {
  //   echo "test public";
  // }

    public function index() {
      $allArtists = $this->model->getAllArtists();
      $pageTwig = 'Artists/allArtists.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render(["allArtists" => $allArtists]);
    }

    public function showArtist(int $id) {
      $artistDetails = $this->model->getArtistDetails($id);
      $pageTwig = 'Artists/showArtist.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render(["artistDetails" => $artistDetails]);
    }

    public function addArtist() {
      // Display the input form on the Add Movie page
      $pageTwig = 'Artists/addArtist.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render();
    }

    public function insertNewArtist() {
      $lastname_artist = $_POST['lastname_artist'];
      $firstname_artist = $_POST['firstname_artist'];
      $birth_date = $_POST['birth_date'];
      $image = $_FILES['image']['name'];
      $image_temp = $_FILES['image']['tmp_name'];
      $biography = $_POST['biography'];

      move_uploaded_file($image_temp, "Uploads/artists/$image");

      $this->model->insertArtist($lastname_artist, $firstname_artist, $birth_date, $image, $biography);

      header("Location: http://localhost/PHP_OOP_movieDB/artists");
    }

    public function showArtistsAndMovies() {
      $allArtists = $this->model->getAllArtists();
      $allMovies = $this->model->getAllMovies();
      $pageTwig = 'Artists/showArtistsAndMovies.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render(["allArtists" => $allArtists, "allMovies" => $allMovies]);
    }

    public function addArtistToMovies() {
      $id_artist = $_POST['id_artist'];
      $id_movie = $_POST['id_movie'];
      $id_uniq = $id_artist . $id_movie;
      $this->model->insertArtistAndMovie($id_artist, $id_movie, $id_uniq);

      header("Location: http://localhost/PHP_OOP_movieDB");
    }
    

}