import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/data/data_source/remote_data_source.dart';
import 'package:movies_app/data/network/app_api.dart';
import 'package:movies_app/data/network/dio_factory.dart';
import 'package:movies_app/data/network/network_info.dart';
import 'package:movies_app/data/repository_impl/repository_impl.dart';
import 'package:movies_app/domain/repository/base_repository.dart';
import 'package:movies_app/domain/usecases/get_popular_usecase.dart';
import 'package:movies_app/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app/presentation/pages/movie/movie_cubit/cubit.dart';

import '../domain/usecases/now_playing_usecase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  /// dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  /// network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  /// app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  /// remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  /// repository
  instance.registerLazySingleton<BaseRepository>(
      () => RepositoryImpl(instance(), instance()));
}

initMovieModule() {
  if (!GetIt.I.isRegistered<NowPlayingUseCase>()) {
    instance.registerFactory<NowPlayingUseCase>(
        () => NowPlayingUseCase(instance()));
    instance.registerFactory<GetPopularUseCase>(
        () => GetPopularUseCase(instance()));
    instance.registerFactory<GetTopRatedUseCase>(
        () => GetTopRatedUseCase(instance()));
    instance.registerFactory<MovieCubit>(
        () => MovieCubit(instance(), instance(), instance()));
  }
}
