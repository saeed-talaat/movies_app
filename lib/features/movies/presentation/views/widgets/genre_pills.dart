import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class GenrePills extends StatelessWidget {
  const GenrePills({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text, style: AppStyles.regular11),
    );
  }
}
