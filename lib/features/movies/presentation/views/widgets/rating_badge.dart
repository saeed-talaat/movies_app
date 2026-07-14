import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({
    super.key, required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Color(0xFFFFD700), size: 15),
        SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: AppStyles.regular11.copyWith(color: Color(0xFFB3B3B3)),
        ),
      ],
    );
  }
}
