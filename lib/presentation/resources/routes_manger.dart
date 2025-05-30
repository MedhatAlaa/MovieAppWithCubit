import 'package:flutter/material.dart';
import 'package:movies_app/presentation/login/login_view.dart';
import 'package:movies_app/presentation/pages/tv/tv_view.dart';
import 'package:movies_app/presentation/register/register_view.dart';
import 'package:movies_app/presentation/resources/string_manger.dart';
import 'package:movies_app/presentation/splash/spalsh_view.dart';

import '../../app/di.dart';
import '../pages/movie/movie_screens/movie_view.dart';
import '../pages/movie/movie_screens/popular_movie.dart';
import '../pages/movie/movie_screens/top_rated_movie.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String movieRoute = '/movie';
  static const String tvRoute = '/tv';
  static const String popularRoute = '/popular';
  static const String topRatedRoute = '/topRated';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.movieRoute:
        initMovieModule();
        return MaterialPageRoute(builder: (context) => const MovieView());
      case Routes.tvRoute:
        return MaterialPageRoute(builder: (context) => const TvView());
      case Routes.popularRoute:
        return MaterialPageRoute(builder: (context) => const PopularMovie());
      case Routes.topRatedRoute:
        return MaterialPageRoute(builder: (context) => const TopRatedMovie());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringManger.noRouteFound),
        ),
        body: const Center(
          child: Text(StringManger.noRouteFound),
        ),
      ),
    );
  }
}
