<?php
require_once 'vendor/autoload.php';

// $mainRouter = new Router($_GET['uri']);
if (isset($_GET['uri']) && ($_GET['uri'] !== "")) {
    $mainRouter = new Router($_GET['uri']);
} else {
    $mainRouter = new Router("/");
}

$mainRouter->addRouteGET('/', 'Movies.index');
$mainRouter->addRouteGET('/movies/show/:id', "Movies.showMovie");

$mainRouter->addRouteGET('/movies/add', "Movies.addMovie");
$mainRouter->addRoutePOST('/movies/add', "Movies.insertNewMovie");

// A list of all the movies with the update and delete options
$mainRouter->addRouteGET('/movies/getallmovies', "Movies.getAllMovies");

// Show all movies; update or delete each movie separately
$mainRouter->addRouteGET('/movies/managemovies/:id', "Movies.getMovie");
$mainRouter->addRoutePOST('/movies/updatemovie/:id', "Movies.updateMovie");
$mainRouter->addRouteGET('/movies/deletemovie/:id', "Movies.deleteMovie");

// Delete movie
// $mainRouter->addRouteGET('/movies/delete', "Movies.getAllMovies");
// $mainRouter->addRoutePOST('/movies/delete/:id', "Movies.deleteMovie");

// List of all artists
$mainRouter->addRouteGET('/artists', 'Artists.index');
$mainRouter->addRouteGET('/artists/show/:id', "Artists.showArtist");

// Administration
$mainRouter->addRouteGET('/admin', 'Admin.index');

// User Registration
$mainRouter->addRouteGET('/register', 'Users.register');
$mainRouter->addRoutePOST('/register', 'Users.register');

// User Login
$mainRouter->addRouteGET('/login', 'Users.login');
$mainRouter->addRoutePOST('/login', 'Users.login');

// User Logout
$mainRouter->addRouteGET('/logout', 'Users.logout');

try {
    $mainRouter->startRouter();
} catch (RouterException $e) {
}