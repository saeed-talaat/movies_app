import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class MovieDetailsOverview extends StatelessWidget {
  const MovieDetailsOverview({super.key, required this.overview});
  final String overview;

  @override
  Widget build(BuildContext context) {
    if (overview.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: AppStyles.semiBold18,
        ),
        const SizedBox(height: 8),
        Text(
          overview.trim(),
          style: AppStyles.regular11.copyWith(
            color: const Color(0xFFCCCCCC),
            height: 1.5,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
