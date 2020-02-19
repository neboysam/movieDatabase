<?php

use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;


/**
 * Class HomeController
 * @mixin
 */
class AdminController extends Controller
{
  /**
   * HomeController constructor
   */
  public function __construct()
  {
    parent::__construct();
    $this->model = new AdminModel();

    self::$_twig = parent::getTwig();
  }

    public function index() {
      $allMovies = $this->model->getAllMovies();
      $pageTwig = 'home.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render(["allMovies" => $allMovies]);
    }

    public function show(int $id) {
      $result = $this->model->getActors($id);
      $movieDetails = $this->model->getMovieDetails($id);
      $pageTwig = 'show.html.twig';
      // self::$_twig->addGlobal('actor', $result);
      $template = self::$_twig->load($pageTwig);
      echo $template->render(["result" => $result, "movieDetails" => $movieDetails]);
    }
}