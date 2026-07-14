import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/genre_pills.dart';

class MovieDetailsGenres extends StatelessWidget {
  const MovieDetailsGenres({super.key, required this.genres});
  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres.map((genre) => GenrePills(text: genre)).toList(),
    );
  }
}
