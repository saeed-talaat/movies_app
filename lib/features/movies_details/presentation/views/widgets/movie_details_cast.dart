import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';

class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({super.key, required this.cast});
  final List<CastEntity> cast;

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Cast', style: AppStyles.semiBold18),
        const SizedBox(height: 12),
        SizedBox(
          height: 98,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length.clamp(0, 10),
            itemBuilder: (context, index) {
              final actor = cast[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[850],
                      backgroundImage: actor.profileUrl.isNotEmpty
                          ? CachedNetworkImageProvider(
                              'https://image.tmdb.org/t/p/w200${actor.profileUrl}',
                            )
                          : null,
                      child: actor.profileUrl.isEmpty
                          ? const Icon(Icons.person, color: Colors.grey)
                          : null,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 70,
                      child: Text(
                        actor.name,
                        style: AppStyles.regular11.copyWith(
                          fontSize: 10,
                          color: const Color(0xFFE0E0E0),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
