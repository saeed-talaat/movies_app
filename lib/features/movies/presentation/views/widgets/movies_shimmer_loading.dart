import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviesShimmerLoading extends StatelessWidget {
  const MoviesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            // Feature Banner Shimmer
            const _BannerShimmer(),
            const SizedBox(height: 16),
            // Popular Movies Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _SectionHeaderShimmer(),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: screenHeight * 0.3,
              child: const _MoviesListShimmer(),
            ),
            const SizedBox(height: 16),
            // Top Rated Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _SectionHeaderShimmer(),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: screenHeight * 0.3,
              child: const _MoviesListShimmer(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BannerShimmer extends StatelessWidget {
  const _BannerShimmer();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}

class _SectionHeaderShimmer extends StatelessWidget {
  const _SectionHeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 140,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Container(
          width: 50,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}

class _MoviesListShimmer extends StatelessWidget {
  const _MoviesListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MovieCardShimmer(),
        );
      },
    );
  }
}

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 100,
            height: 13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 60,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

