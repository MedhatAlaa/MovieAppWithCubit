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

class PopularMovie extends StatelessWidget {
  const PopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          instance<MovieCubit>()..getPopularMovie(),
      child: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var popular = MovieCubit.get(context).getPopular;
          return Scaffold(
            backgroundColor: ColorManger.black,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: ColorManger.yellow,
                  size: AppSize.s20,
                ),
              ),
              title: Text(
                StringManger.popularMovie,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              centerTitle: true,
            ),
            body: _popularMovieWidget(popular, context),
          );
        },
      ),
    );
  }

  Widget _popularMovieWidget(List<MovieModel> item, context) {
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(AppSize.s4),
        width: double.infinity,
        height: AppSize.s160,
        decoration: BoxDecoration(
          color: ColorManger.darkGrey,
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
        child: Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s12),
                child: Image.network(
                  AppConstance.imageUrl(item[index].posterPath),
                  fit: BoxFit.cover,
                  height: AppSize.s170,
                  width: AppSize.s120,
                ),
              ),
            ),
            const SizedBox(
              width: AppSize.s12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSize.s2),
                        height: AppSize.s22,
                        decoration: BoxDecoration(
                          color: ColorManger.orange,
                          borderRadius: BorderRadius.circular(
                            AppSize.s4,
                          ),
                        ),
                        child: Text(
                          item[index].releaseDate,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s12,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: AppSize.s20,
                      ),
                      const SizedBox(
                        width: AppSize.s4,
                      ),
                      Text(
                        '${item[index].voteAverage}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Text(
                    item[index].overView,
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s12,
      ),
      itemCount: item.length,
    );
  }
}
