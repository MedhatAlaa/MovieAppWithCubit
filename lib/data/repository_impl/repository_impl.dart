import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_source/remote_data_source.dart';
import 'package:movies_app/data/mapper/mapper.dart';
import 'package:movies_app/data/network/error_handler.dart';
import 'package:movies_app/data/network/failure.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/domain/repository/base_repository.dart';
import '../network/network_info.dart';

class RepositoryImpl implements BaseRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ResultsModel>> getNowPlaying() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getNowPlaying();
        if (response.statusCode == AppInternalServer.FAILURE) {
          return Left(
            Failure(
              AppInternalServer.FAILURE,
              response.statusMessage ?? ResponseMessage.DEFAULT,
            ),
          );
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      /// no internet  connection try again later
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ResultsModel>> getPopular() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getPopular();
        if (response.statusCode == AppInternalServer.FAILURE) {
          return Left(
            Failure(
              AppInternalServer.FAILURE,
              response.statusMessage ?? ResponseMessage.DEFAULT,
            ),
          );
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ResultsModel>> getTopRated() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getTopRated();
        if (response.statusCode == AppInternalServer.FAILURE) {
          return Left(
            Failure(
              AppInternalServer.FAILURE,
              response.statusMessage ?? ResponseMessage.DEFAULT,
            ),
          );
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      int movieId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getMovieDetails(movieId);
        if (response.statusCode == AppInternalServer.FAILURE) {
          return Left(Failure(
            AppInternalServer.FAILURE,
            response.statusMessage ?? ResponseMessage.DEFAULT,
          ));
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
