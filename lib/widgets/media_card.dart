import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jellyone/db/db.dart';
import 'package:jellyone/screens/info.dart';
import 'package:jellyone/theme/app_styles.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({super.key, required this.movie});
  final MoviesTableData movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MediaInfoScreen(movie: movie)),
            );
          },
          // hoverColor: Colors.transparent,
          // splashColor: Colors.transparent,
          child: Card(
            elevation: 0,
            // margin: EdgeInsets.only(right: 8),
            color: Colors.transparent,
            child: SizedBox(
              width: 195,
              height: 340,
              child: Column(
                children: [
                  Image(
                    image: FastCachedImageProvider(
                        'https://image.tmdb.org/t/p/original${movie.posterPath}'),
                    // width: 195,
                    height: 280,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      movie.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: AppTheme.text, fontSize: 15),
                    ),
                  ),
                  Text(
                    '${movie.releaseDate.year}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppTheme.subText, fontSize: 13),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 340,
          width: 8,
        )
      ],
    );
  }
}
