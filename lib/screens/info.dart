import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:jellyone/widgets/cast_card.dart';

class MediaInfoScreen extends StatelessWidget {
  final int id;

  const MediaInfoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -100),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/poster_tiou.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width:
                            max(MediaQuery.of(context).size.width * 0.3, 400),
                      ),
                      const Center(
                        child: Image(
                          image: AssetImage('assets/images/logo_tiou.png'),
                          height: 120,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 32, 32, 0.8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width:
                              max(MediaQuery.of(context).size.width * 0.3, 350),
                        ),
                        Expanded(
                          child: Container(
                            // alignment: Alignment.centerLeft,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Anyone But You',
                                        style: TextStyle(fontSize: 26),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        '2023',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        '1h 43m',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 8.5, right: 8.5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppTheme.text)),
                                        child: const Text(
                                          'R',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          Text(
                                            '7.2',
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Ends at 12:00 AM',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Icon(Icons.play_arrow)),
                                TextButton(
                                  onPressed: () {},
                                  child: Icon(Icons.done),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: AppTheme.dark,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:
                              max(MediaQuery.of(context).size.width * 0.3, 350),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(60),
                                child: Transform.translate(
                                  offset: const Offset(0, -150),
                                  child: Image(
                                    image: AssetImage('assets/images/tiou.jpg'),
                                    width: max(
                                        MediaQuery.of(context).size.width * 0.4,
                                        400),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: AppTheme.dark,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  'When the last thing you expect becomes the only thing you want.',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 18),
                                const Text(
                                    "Solène, a 40-year-old single mom, begins an unexpected romance with 24-year-old Hayes Campbell, the lead singer of August Moon, the hottest boy band on the planet. When Solène must step in to chaperone her teenage daughter's trip to the Coachella Music Festival after her ex bails at the last minute, she has a chance encounter with Hayes and there is an instant, undeniable spark. As they begin a whirlwind romance, it isn't long before Hayes' superstar status poses unavoidable challenges to their relationship, and Solène soon discovers that life in the glare of his spotlight might be more than she bargained for.",
                                    style: TextStyle(fontSize: 15)),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Genre'),
                                    const SizedBox(width: 40),
                                    Row(
                                      children: List.generate(3, (index) {
                                        return const Text('Drama',
                                            style: TextStyle(fontSize: 15));
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Director'),
                                    const SizedBox(width: 40),
                                    Row(
                                      children: List.generate(1, (index) {
                                        return const Text('Will Gluck',
                                            style: TextStyle(fontSize: 15));
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Writer'),
                                    const SizedBox(width: 40),
                                    Row(
                                      children: List.generate(3, (index) {
                                        return const Text('Will Gluck',
                                            style: TextStyle(fontSize: 15));
                                      }),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 23),
                                const Text('Cast & Crew',
                                    style: TextStyle(fontSize: 22)),
                                SizedBox(
                                  height: 340,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      // padding: const EdgeInsets.only(right: 14.0),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return const CastCard(id: 1);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
