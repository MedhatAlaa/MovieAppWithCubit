import 'package:movies_app/app/app_constance.dart';
import 'package:movies_app/app/extensions.dart';
import 'package:movies_app/data/response/response.dart';
import 'package:movies_app/domain/models/movie_model.dart';

extension MovieResponseMapper on MovieResponse? {
  MovieModel toDomain() {
    return MovieModel(
      (this?.genreId?.map((value) => value.orZero()) ?? const Iterable.empty())
          .cast<int>()
          .toList(),
      this?.id?.orZero() ?? AppConstance.emptyInt,
      this?.title?.orEmpty() ?? AppConstance.emptyString,
      this?.overView?.orEmpty() ?? AppConstance.emptyString,
      this?.posterPath?.orEmpty() ?? AppConstance.emptyString,
      this?.releaseDate?.orEmpty() ?? AppConstance.emptyString,
      this?.voteAverage,
      this?.voteCount,
    );
  }
}

extension ResultResponseMapper on ResultResponse? {
  ResultsModel toDomain() {
    List<MovieModel> results =
        (this?.results?.map((value) => value.toDomain()) ??
                const Iterable.empty())
            .cast<MovieModel>()
            .toList();

    return ResultsModel(results);
  }
}

extension GenresResponseMapper on GenresResponse? {
  GenresModel toDomain() {
    return GenresModel(
      this?.id?.orZero() ?? AppConstance.emptyInt,
      this?.name.orEmpty() ?? AppConstance.emptyString,
    );
  }
}

extension MovieDetailsResponseMapper on MovieDetailsResponse? {
  MovieDetailsModel toDomain() {
    return MovieDetailsModel(
      this?.id?.orZero() ?? AppConstance.emptyInt,
      this?.backdropPath.orEmpty() ?? AppConstance.emptyString,
      this?.posterPath.orEmpty() ?? AppConstance.emptyString,
      this?.title.orEmpty() ?? AppConstance.emptyString,
      this?.overview.orEmpty() ?? AppConstance.emptyString,
      this?.releaseDate.orEmpty() ?? AppConstance.emptyString,
      this?.runtime?.orZero() ?? AppConstance.emptyInt,
      (this?.genres?.map((genres) => genres.toDomain()) ??
              const Iterable.empty().cast<GenresModel>())
          .toList(),
      this?.voteAverage,
    );
  }
}
