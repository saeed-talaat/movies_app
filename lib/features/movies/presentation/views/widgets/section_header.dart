import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.semiBold18),
        Text(
          'See All',
          style: AppStyles.meduim13.copyWith(color: Color(0xFFE50914)),
        ),
      ],
    );
  }
}
