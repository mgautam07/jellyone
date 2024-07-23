import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jellyone/db/db.dart';
import 'package:jellyone/screens/season_info.dart';
import 'package:jellyone/theme/app_styles.dart';

class SeasonCard extends StatelessWidget {
  const SeasonCard(
      {super.key,
      required this.season,
      required this.name,
      required this.logoPath,
      required this.posterPath,
      required this.backdropPath});
  final Season season;
  final String name;
  final String logoPath;
  final String posterPath;
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SeasonInfoScreen(
                          season: season,
                          name: name,
                          logoPath: logoPath,
                          posterPath: posterPath,
                          backdropPath: backdropPath,
                        )),
              );
            },
            hoverColor: AppTheme.medium,
            child: SizedBox(
              width: 195,
              height: 340,
              child: Column(
                children: [
                  Image(
                    image: FastCachedImageProvider(
                        'https://image.tmdb.org/t/p/original${season.posterPath}'),
                    height: 280,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Season ${season.number}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: AppTheme.text, fontSize: 15),
                    ),
                  ),
                  Text(
                    '${season.airDate.year}',
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: AppTheme.subText, fontSize: 13),
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
