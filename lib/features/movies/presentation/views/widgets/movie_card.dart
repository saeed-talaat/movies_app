import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/rating_badge.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${AppRouter.kMovieDetailsView}/${moviesEntity.movieId}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildPoster(moviesEntity.posterUrl),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            moviesEntity.title.length > 20
                ? moviesEntity.title.substring(0, 20)
                : moviesEntity.title,
            style: AppStyles.meduim13,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          RatingBadge(rating: moviesEntity.rating),
        ],
      ),
    );
  }

  Widget _buildPoster(String path) {
    if (path.isEmpty) {
      return Container(
        color: Colors.grey[850],
        child: const Icon(Icons.image_not_supported, color: Colors.grey),
      );
    }
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/w200$path',
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[850],
        child: const Icon(Icons.image_not_supported, color: Colors.grey),
      ),
    );
  }
}
