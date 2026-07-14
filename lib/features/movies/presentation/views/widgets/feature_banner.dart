import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies/presentation/manger/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/genre_pills.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/movie_action_button.dart';

class FeatureBanner extends StatelessWidget {
  const FeatureBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = context.read<MoviesCubit>().nowPlayingMovies;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Positioned.fill(child: _buildBackdrop(movie?.backdropUrl)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.4, 0.75, 1.0],
                  colors: [
                    const Color(0xff141414).withAlpha(0),
                    const Color(0xff141414).withAlpha(100),
                    const Color(0xff141414).withAlpha(190),
                    const Color(0xff141414),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie?.title ?? '',
                  style: AppStyles.bold24,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  children: (movie?.genres ?? [])
                      .take(3)
                      .map((genre) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GenrePills(text: genre),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 8),
                const MovieActionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackdrop(String? path) {
    if (path == null || path.isEmpty) {
      return Container(
        color: Colors.grey[850],
        child: const Icon(Icons.image_not_supported, color: Colors.grey, size: 40),
      );
    }
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/w500$path',
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[850],
        child: const Icon(Icons.image_not_supported, color: Colors.grey, size: 40),
      ),
    );
  }
}
