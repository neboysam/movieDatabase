<?php

class MoviesModel extends Model {
    public function __construct()
    {
      $this->pdo = parent::getPdo();
    }

    public function getActorsDetails($id) {
      $req = $this->pdo->prepare('SELECT * FROM artists a, movies m, artists_movies r where a.id_artist = r.id_artist AND m.movie_id = r.id_movie AND m.movie_id = ? AND a.id_artist NOT IN (SELECT director_id FROM movies)');
      $req->execute([$id]);
      return $req->fetchAll();
    }

    public function getMovieDetails($id) {
      $req = $this->pdo->prepare('SELECT * FROM movies WHERE movie_id = ?');
      $req->execute([$id]);
      return $req->fetch();
    }

    public function getAllMovies() {
      $req = $this->pdo->prepare(
        'SELECT * FROM movies'
      );
      $req->execute();
      return $req->fetchAll();
    }

    public function getAllDirectors() {
      $req = $this->pdo->prepare(
        'SELECT DISTINCT a.id_artist, a.firstname_artist, a.lastname_artist FROM artists a, movies m WHERE a.id_artist = m.director_id');
      $req->execute();
      return $req->fetchAll();
    }

    public function getAllGenres() {
      $req = $this->pdo->prepare(
        'SELECT * FROM movie_genres'
      );
      $req->execute();
      return $req->fetchAll();
    }

    public function insertMovie($titre, $annee_sortie, $affiche, $synopsis, $genre, $director) {
      $sql = "INSERT INTO film (titre, annee_sortie, affiche, synposis, genre_id_genre, artiste_id_artiste) VALUES (:titre, :annee_sortie, :affiche, :synopsis, :genre, :director)";
      $req = self::$_pdo->prepare($sql);
      return $req->execute(['titre' => $titre, 'annee_sortie' => $annee_sortie, 'affiche' => $affiche, 'synopsis' => $synopsis, 'genre' => $genre, 'director' => $director]);
    }

    public function getDirectorDetails($id) {
      $req = $this->pdo->prepare(
        'SELECT DISTINCT a.id_artist, a.lastname_artist, a.firstname_artist FROM artists a, movies m WHERE a.id_artist = m.director_id AND m.movie_id = ?');
      $req->execute([$id]);
      return $req->fetch();
    }

    public function getAllOtherDirectors($id) {
      $req = $this->pdo->prepare(
        'SELECT DISTINCT m.director_id, a.firstname_artist, a.lastname_artist FROM artists a, movies m WHERE m.director_id = a.id_artist AND m.director_id NOT IN
        (SELECT id_artist FROM artists a, movies m WHERE a.id_artist = m.director_id AND m.movie_id = ? )'
        );
      $req->execute([$id]);
      return $req->fetchAll();
    }

    public function getGenre($id) {
      $req = $this->pdo->prepare(
        'SELECT * FROM movie_genres g, movies m WHERE g.id_genre = m.genre_id AND m.movie_id = ?'
      );
      $req->execute([$id]);
      return $req->fetch();
    }

    public function getAllOtherGenres($id) {
      $req = $this->pdo->prepare(
        'SELECT * FROM movie_genres WHERE genre NOT IN
        (SELECT genre FROM movie_genres g, movies m WHERE g.id_genre = m.genre_id AND m.movie_id = ?)'
      );
      $req->execute([$id]);
      return $req->fetchAll();
    }

    public function updateMovie($movie_id, $title, $release_year, $poster, $synopsis, $genre_id, $director_id) {
      $req = self::$_pdo->prepare(
        'UPDATE movies SET title=:title, release_year=:release_year, poster=:poster, synposis=:sinopsis, genre_id=:genre_id, director_id=:director_id WHERE movie_id=:movie_id'
      );
      $req->execute(['title' => $title, 'release_year' => $release_year, 'poster' => $poster, 'synposis' => $synopsis, 'genre_id' => $genre_id, 'director_id' => $director_id]);
    }
}