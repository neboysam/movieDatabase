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

}