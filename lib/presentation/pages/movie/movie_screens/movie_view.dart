import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/app/di.dart';
import 'package:movies_app/presentation/pages/movie/movie_cubit/cubit.dart';
import 'package:movies_app/presentation/pages/movie/movie_cubit/states.dart';
import 'package:movies_app/presentation/resources/color_manger.dart';
import 'package:movies_app/presentation/resources/string_manger.dart';
import 'package:movies_app/presentation/resources/values_manger.dart';

import '../../../../app/app_constance.dart';
import '../../../../domain/models/movie_model.dart';
import '../../../resources/routes_manger.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MovieCubit(instance(), instance(), instance())
            ..getPopularMovie()
            ..getNowPlayingMovie()
            ..getTopRatedMovie(),
      child: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var nowPlaying = MovieCubit.get(context).nowPlaying;
          var popular = MovieCubit.get(context).getPopular;
          var topRated = MovieCubit.get(context).topRated;
          return Scaffold(
            backgroundColor: ColorManger.black,
            body: SingleChildScrollView(
              child: Column(children: [
                _getNowPlayingWidget(nowPlaying, context),
                Row(
                  children: [
                    _getTitle(
                      StringManger.popular,
                      context,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        /// navigate to popular details screen
                        Navigator.pushNamed(context, Routes.popularRoute);
                      },
                      child: _getTitle(
                        StringManger.seeMore,
                        context,
                      ),
                    ),
                  ],
                ),
                _getPopularWidget(popular, context),
                Row(
                  children: [
                    _getTitle(
                      StringManger.topRated,
                      context,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        /// navigate to top rated details screen
                        Navigator.pushNamed(context, Routes.topRatedRoute);
                      },
                      child: _getTitle(
                        StringManger.seeMore,
                        context,
                      ),
                    ),
                  ],
                ),
                _getTopRatedWidget(topRated, context),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _getNowPlayingWidget(List<MovieModel> results, context) {
    return CarouselSlider(
      items: results.map((item) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(
              AppConstance.imageUrl(item.posterPath),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
            //   color: Colors.black.withOpacity(0.6),
            //   height: 50.0,
            //   width: double.infinity,
            //   child: Text(
            //     item.title,
            //     textAlign: TextAlign.center,
            //     style: Theme.of(context).textTheme.bodySmall,
            //   ),
            // ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        height: AppSize.s400,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        viewportFraction: 1.0,
      ),
    );
  }

  Widget _getTitle(String title, context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: Text(title, style: Theme.of(context).textTheme.titleSmall),
    );
  }

  Widget _getPopularWidget(List<MovieModel> results, context) {
    return SizedBox(
      height: AppSize.s200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: results.map((item) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s12),
              child: Image.network(
                AppConstance.imageUrl(item.posterPath),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _getTopRatedWidget(List<MovieModel> results, context) {
    return SizedBox(
      height: AppSize.s200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: results.map((item) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s12),
              child: Image.network(
                AppConstance.imageUrl(item.posterPath),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
