import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies_details/presentation/manger/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_body.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_shimmer.dart';

class MovieDetailsBodyBlocBuilder extends StatelessWidget {
  const MovieDetailsBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          return MovieDetailsBody(movieDetails: state.movieDetails);
        } else if (state is MovieDetailsFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                state.errorMessage,
                style: AppStyles.bold24,
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return const MovieDetailsShimmer();
        }
      },
    );
  }
}
