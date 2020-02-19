<?php

class HomeModel extends Model {
    public function __construct()
    {
        $this->pdo = parent::getPdo();
    }

    public function getActors($id) {
        $req = $this->pdo->prepare('SELECT lastname_artist, firstname_artist FROM artists a, movies m, artists_movies r where a.id_artist = r.artists_movies AND m.movie_id = r.id_movie AND m.movie_id = ? AND a.id_artist NOT IN (SELECT id_artist FROM movies)');
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
}
