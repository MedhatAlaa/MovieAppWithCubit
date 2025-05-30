import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/domain/usecases/get_popular_usecase.dart';
import 'package:movies_app/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app/presentation/pages/movie/movie_cubit/states.dart';
import '../../../../domain/usecases/now_playing_usecase.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit(this._nowPlayingUseCase, this._getPopularUseCase,
      this._getTopRatedUseCase)
      : super(MovieInitialState());

  static MovieCubit get(context) => BlocProvider.of(context);

  final NowPlayingUseCase _nowPlayingUseCase;
  final GetPopularUseCase _getPopularUseCase;
  final GetTopRatedUseCase _getTopRatedUseCase;
  List<MovieModel> nowPlaying = [];
  List<MovieModel> getPopular = [];
  List<MovieModel> topRated = [];

  getNowPlayingMovie() async {
    emit(GetNowPlayingLoadingState());
    (await _nowPlayingUseCase.execute(Void)).fold(
        ((failure) => {
              emit(GetNowPlayingErrorState()),
            }),
        (data) => {
              nowPlaying = data.results,
              emit(GetNowPlayingSuccessState()),
            });
  }

  getPopularMovie() async {
    emit(GetPopularLoadingState());
    (await _getPopularUseCase.execute(Void)).fold(
        ((failure) => {
              emit(GetPopularErrorState()),
            }),
        (data) => {
              getPopular = data.results,
              emit(GetPopularSuccessState()),
            });
  }

  getTopRatedMovie() async {
    emit(GetTopRatedLoadingState());
    (await _getTopRatedUseCase.execute(Void)).fold(
        ((failure) => {
              emit(GetTopRatedErrorState()),
            }),
        (data) => {
              topRated = data.results,
              emit(GetTopRatedSuccessState()),
            });
  }
}
