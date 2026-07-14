import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies/presentation/manger/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/feature_banner.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/popular_movies_list.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/section_header.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/top_rated_movies_list.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              FeatureBanner(),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SectionHeader(title: 'Popular Movies'),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: screenHeight * 0.3,
                child: PopularMoviesList(
                  movies: context.read<MoviesCubit>().popularMovies,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SectionHeader(title: 'Top Rated'),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: screenHeight * 0.3,
                child: TopRatedMoviesList(
                  movies: context.read<MoviesCubit>().topRatedMovies,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
