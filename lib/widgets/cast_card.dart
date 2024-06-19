import 'package:flutter/material.dart';
import 'package:jellyone/screens/info.dart';
import 'package:jellyone/theme/app_styles.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MediaInfoScreen(id: id)),
            );
          },
          // hoverColor: Colors.transparent,
          // splashColor: Colors.transparent,
          child: const Card(
            elevation: 0,
            // margin: EdgeInsets.only(right: 8),
            color: Colors.transparent,
            child: SizedBox(
              width: 195,
              height: 340,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/anne.jpg'),
                    // width: 195,
                    height: 280,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Anne Hathaway',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppTheme.text, fontSize: 15),
                    ),
                  ),
                  Text(
                    'as Solène Marchand',
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
