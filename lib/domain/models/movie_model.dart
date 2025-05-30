class MovieModel {
  List<int> genreId;
  int id;
  String title;
  String overView;
  String posterPath;
  String releaseDate;
  dynamic voteAverage;
  dynamic voteCount;

  MovieModel(this.genreId, this.id, this.title, this.overView, this.posterPath,
      this.releaseDate, this.voteAverage, this.voteCount);
}

class ResultsModel {
  List<MovieModel> results;

  ResultsModel(this.results);
}

class GenresModel {
  int id;
  String name;

  GenresModel(this.id, this.name);
}

class MovieDetailsModel {
  int id;
  String backdropPath;
  String posterPath;
  String title;
  String overview;
  String releaseDate;
  int runtime;
  List<GenresModel> genres;
  dynamic voteAverage;

  MovieDetailsModel(
    this.id,
    this.backdropPath,
    this.posterPath,
    this.title,
    this.overview,
    this.releaseDate,
    this.runtime,
    this.genres,
    this.voteAverage,
  );
}
