import 'package:dartz/dartz.dart';
import 'package:movies_app/data/network/failure.dart';
import 'package:movies_app/domain/models/movie_model.dart';

abstract class BaseRepository {
  Future<Either<Failure, ResultsModel>> getNowPlaying();

  Future<Either<Failure, ResultsModel>> getPopular();

  Future<Either<Failure, ResultsModel>> getTopRated();

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId);
}
