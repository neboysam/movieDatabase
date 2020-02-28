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

$mainRouter->addRouteGET('/admin/movies/add', "Movies.addMovie");
$mainRouter->addRoutePOST('/admin/movies/add', "Movies.insertNewMovie");

// A list of all the movies with the update and delete options
$mainRouter->addRouteGET('/admin/movies/getallmovies', "Movies.getAllMovies");

// Update movie
$mainRouter->addRouteGET('/admin/movies/updatemovie/:id', "Movies.getMovie");
$mainRouter->addRoutePOST('/admin/movies/updatemovie/:id', "Movies.updateMovie");

// Delete movie
$mainRouter->addRouteGET('/admin/movies/deletemovie/:id', "Movies.deleteMovie");

// Delete movie
// $mainRouter->addRouteGET('/movies/delete', "Movies.getAllMovies");
// $mainRouter->addRoutePOST('/movies/delete/:id', "Movies.deleteMovie");

// List of all artists
$mainRouter->addRouteGET('/artists', 'Artists.index');
$mainRouter->addRouteGET('/artists/show/:id', "Artists.showArtist");

// Add artist
$mainRouter->addRouteGET('/admin/artists/add', 'Artists.addArtist');
$mainRouter->addRoutePOST('/admin/artists/add', 'Artists.insertNewArtist');

// Add artist to movies
$mainRouter->addRouteGET('/admin/artists/addtomovies', 'Artists.showArtistAndMovies');
$mainRouter->addRoutePOST('/admin/artists/addtomovies', 'Artists.addArtistToMovies');

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