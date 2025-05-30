import 'package:dartz/dartz.dart';
import 'package:movies_app/data/network/failure.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/domain/repository/base_repository.dart';
import 'base_usecase.dart';

class GetMovieDetailsUseCase implements BaseUseCase<int, MovieDetailsModel> {
  final BaseRepository _baseRepository;

  GetMovieDetailsUseCase(this._baseRepository);

  @override
  Future<Either<Failure, MovieDetailsModel>> execute(int input) async {
    return await _baseRepository.getMovieDetails(input);
  }
}

/// todo next step presentation layer (ان شاء الله)
