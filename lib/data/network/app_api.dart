import 'package:dio/dio.dart';
import 'package:movies_app/app/app_constance.dart';
import 'package:movies_app/data/response/response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(AppConstance.nowPlaying)
  Future<ResultResponse> getNowPlaying();

  @GET(AppConstance.getPopular)
  Future<ResultResponse> getPopular();

  @GET(AppConstance.topRated)
  Future<ResultResponse> getTopRated();

  @GET(AppConstance.movieDetails)
  Future<MovieDetailsResponse> getMovieDetails(@Path('movie_id') int movieId);
}
