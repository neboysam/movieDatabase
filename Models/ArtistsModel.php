<?php

class ArtistsModel extends Model {
    public function __construct()
    {
        $this->pdo = parent::getPdo();
    }

  //   public function getActors($id) {
  //       $req = $this->pdo->prepare('SELECT nom_artiste, prenom_artiste FROM artiste a, film f, artiste_has_film m where a.id_artiste = m.artiste_id_artiste AND f.id_film = m.film_id_film AND f.id_film = ? AND a.id_artiste NOT IN (SELECT artiste_id_artiste FROM film)');
  //       $req->execute([$id]);
  //       return $req->fetchAll();
  //   }

  //   public function getMovieDetails($id) {
  //     $req = $this->pdo->prepare('SELECT * FROM film WHERE id_film = ?');
  //     $req->execute([$id]);
  //     return $req->fetch();
  // }

    public function getAllArtists() {
        $req = $this->pdo->prepare(
          'SELECT * FROM artists ORDER BY lastname_artist'
        );
        $req->execute();
        return $req->fetchAll();
    }

    public function getAllMovies() {
      $req = $this->pdo->prepare(
        'SELECT * FROM movies'
      );
      $req->execute();
      return $req->fetchAll();
  }

    public function getArtistDetails($id) {
      $req = $this->pdo->prepare('SELECT * FROM artists WHERE id_artist = ?');
      $req->execute([$id]);
      return $req->fetch();
    }

    public function insertArtist($lastname_artist, $firstname_artist, $birth_date, $image, $biography) {
      $sql = "INSERT INTO artists (lastname_artist, firstname_artist, birth_date, image, biography) VALUES (:lastname_artist, :firstname_artist, :birth_date, :image, :biography)";
      $req = self::$_pdo->prepare($sql);
      return $req->execute(['lastname_artist' => $lastname_artist, 'firstname_artist' => $firstname_artist, 'birth_date' => $birth_date, 'image' => $image, 'biography' => $biography]);
    }

    public function insertArtistAndMovie($id_artist, $id_movie, $id_uniq) {
      $sql = "INSERT INTO artists_movies (id_artist, id_movie, id_uniq) VALUES (:id_artist, :id_movie, :id_uniq)";
      $req = self::$_pdo->prepare($sql);
      return $req->execute(['id_artist' => $id_artist, 'id_movie' => $id_movie, 'id_uniq' => $id_uniq]);
    }
}
