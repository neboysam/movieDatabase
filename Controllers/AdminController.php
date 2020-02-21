<?php

use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

/**
 * Class AdminController
 * @mixin
 */
class AdminController extends Controller
{
  /**
   * AdminController constructor
   */
  public function __construct()
  {
    parent::__construct();
    // $this->model = new HomeModel();
    self::$_twig = parent::getTwig();
  }

    public function index() {
      // $allMovies = $this->model->getAllMovies();
      $pageTwig = 'Admin/admin.home.html.twig';
      $template = self::$_twig->load($pageTwig);
      echo $template->render();
    }
}