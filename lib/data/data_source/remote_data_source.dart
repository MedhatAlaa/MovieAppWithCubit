import 'package:movies_app/data/network/app_api.dart';
import '../response/response.dart';

abstract class RemoteDataSource {
  Future<ResultResponse> getNowPlaying();

  Future<ResultResponse> getPopular();

  Future<ResultResponse> getTopRated();

  Future<MovieDetailsResponse> getMovieDetails(int movieId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<ResultResponse> getNowPlaying() async {
    return await _appServiceClient.getNowPlaying();
  }

  @override
  Future<ResultResponse> getPopular() async {
    return await _appServiceClient.getPopular();
  }

  @override
  Future<ResultResponse> getTopRated() async {
    return await _appServiceClient.getTopRated();
  }

  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    return await _appServiceClient.getMovieDetails(movieId);
  }
}
