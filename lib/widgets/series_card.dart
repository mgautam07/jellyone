import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jellyone/db/db.dart';
import 'package:jellyone/screens/series_info.dart';
import 'package:jellyone/theme/app_styles.dart';

class SeriesCard extends StatelessWidget {
  const SeriesCard({super.key, required this.series});
  final Sery series;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeriesInfoScreen(series: series)),
            );
          },
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              width: 195,
              height: 340,
              child: Column(
                children: [
                  Image(
                    image: FastCachedImageProvider(
                        'https://image.tmdb.org/t/p/original${series.posterPath}'),
                    height: 280,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      series.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: AppTheme.text, fontSize: 15),
                    ),
                  ),
                  Text(
                    '${series.firstAirDate.year}',
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
