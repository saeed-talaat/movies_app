import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/rating_badge.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.movie});
  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${AppRouter.kMovieDetailsView}/${movie.movieId}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildPoster(movie.posterUrl),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: AppStyles.meduim13,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          RatingBadge(rating: movie.rating),
        ],
      ),
    );
  }

  Widget _buildPoster(String path) {
    if (path.isEmpty) {
      return Container(
        color: Colors.grey[850],
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 40,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/w342$path',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[850],
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 40,
        ),
      ),
    );
  }
}
