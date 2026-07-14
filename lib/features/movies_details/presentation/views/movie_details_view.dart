import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/get_it.dart';
import 'package:movies_app/features/movies_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/features/movies_details/presentation/manger/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_body_bloc_builder.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(
        useCase: getIt<GetMovieDetailsUseCase>(),
      )..getMovieDetails(movieId: movieId),
      child: const Scaffold(
        body: MovieDetailsBodyBlocBuilder(),
      ),
    );
  }
}
