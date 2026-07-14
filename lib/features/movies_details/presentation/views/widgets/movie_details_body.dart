import 'package:flutter/material.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_cast.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_genres.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_header.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_info_row.dart';
import 'package:movies_app/features/movies_details/presentation/views/widgets/movie_details_overview.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.movieDetails});
  final MovieDetailsEntity movieDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailsHeader(movieDetails: movieDetails),
          const SizedBox(height: 76),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieDetailsInfoRow(movieDetails: movieDetails),
                const SizedBox(height: 16),
                MovieDetailsGenres(genres: movieDetails.genres),
                const SizedBox(height: 20),
                MovieDetailsOverview(overview: movieDetails.overview),
                const SizedBox(height: 20),
                MovieDetailsCast(cast: movieDetails.cast),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
