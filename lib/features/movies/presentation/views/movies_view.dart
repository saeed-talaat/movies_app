import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/get_it.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movies_app/features/movies/presentation/manger/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/build_movies_app_bar.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/movies_view_body_bloc_builder.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesCubit(
              getPopularMoviesUseCase: getIt<GetPopularMoviesUseCase>(),
              getTopRatedMoviesUseCase: getIt<GetTopRatedMoviesUseCase>(),
              getNowPlayingMoviesUseCase: getIt<GetNowPlayingMoviesUseCase>(),
            )
            ..getNowPlayingMovies()
            ..getPopularMovies()
            ..getTopRatedMovies(),

      child: Scaffold(
        appBar: buildMoviesAppBar(context),
        body: SafeArea(child: MoviesViewBodyBlocBuilder()),
      ),
    );
  }
}
