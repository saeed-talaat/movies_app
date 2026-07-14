import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchShimmerLoading extends StatelessWidget {
  const SearchShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: GridView.builder(
        itemCount: 6,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return const SearchShimmerItem();
        },
      ),
    );
  }
}

class SearchShimmerItem extends StatelessWidget {
  const SearchShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 100,
          height: 12,
          color: Colors.white,
        ),
        const SizedBox(height: 6),
        Container(
          width: 50,
          height: 10,
          color: Colors.white,
        ),
      ],
    );
  }
}
