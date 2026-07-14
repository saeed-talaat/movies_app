import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({super.key, required this.movieDetails});
  final MovieDetailsEntity movieDetails;

  @override
  Widget build(BuildContext context) {
    final year = movieDetails.releaseDate.split('-').first;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w780${movieDetails.backdropUrl}',
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(color: Colors.grey[850]),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withAlpha(80), const Color(0xff141414)],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black.withAlpha(150),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        Positioned(
          bottom: -60,
          left: 16,
          right: 16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w200${movieDetails.posterUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(movieDetails.title, style: AppStyles.bold22, maxLines: 2),
                    const SizedBox(height: 4),
                    Text(year, style: AppStyles.regular11.copyWith(color: Colors.grey)),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE50914),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Play Trailer'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
