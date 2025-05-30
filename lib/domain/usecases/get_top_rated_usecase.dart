import 'package:dartz/dartz.dart';
import 'package:movies_app/data/network/failure.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/domain/repository/base_repository.dart';
import 'package:movies_app/domain/usecases/base_usecase.dart';

class GetTopRatedUseCase implements BaseUseCase<void, ResultsModel> {
  final BaseRepository _baseRepository;

  GetTopRatedUseCase(this._baseRepository);

  @override
  Future<Either<Failure, ResultsModel>> execute(void input) async {
    return await _baseRepository.getTopRated();
  }
}
