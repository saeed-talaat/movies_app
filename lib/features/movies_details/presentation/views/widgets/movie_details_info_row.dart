import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/rating_badge.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';

class MovieDetailsInfoRow extends StatelessWidget {
  const MovieDetailsInfoRow({super.key, required this.movieDetails});
  final MovieDetailsEntity movieDetails;

  String _formatDuration(int minutes) {
    if (minutes <= 0) return '';
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (hours > 0) {
      return '${hours}h ${remainingMinutes}m';
    }
    return '${remainingMinutes}m';
  }

  String _getYear(String dateStr) {
    if (dateStr.isEmpty) return '';
    try {
      final parts = dateStr.split('-');
      if (parts.isNotEmpty) return parts[0];
    } catch (_) {}
    return dateStr;
  }

  @override
  Widget build(BuildContext context) {
    final year = _getYear(movieDetails.releaseDate);
    final duration = _formatDuration(movieDetails.runtime);

    return Row(
      children: [
        RatingBadge(rating: movieDetails.rating),
        if (year.isNotEmpty) ...[
          const SizedBox(width: 16),
          _infoText(year),
        ],
        if (duration.isNotEmpty) ...[
          const SizedBox(width: 16),
          _infoText(duration),
        ],
      ],
    );
  }

  Widget _infoText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppStyles.regular11.copyWith(
          color: const Color(0xFFB3B3B3),
        ),
      ),
    );
  }
}
