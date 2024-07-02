import 'package:flutter/material.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key, required this.actor});
  final Map<String, String> actor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 5),
      child: Row(
        children: [
          Card(
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
                        'https://image.tmdb.org/t/p/original${actor['profilePath']}'),
                    height: 280,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      actor['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppTheme.text,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    'as ${actor['as']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppTheme.subText,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 340,
            width: 8,
          )
        ],
      ),
    );
  }
}
