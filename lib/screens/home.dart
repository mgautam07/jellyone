import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jellyone/widgets/media_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            const Text(
              'LM',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(width: double.infinity, height: 10),
            SizedBox(
              height: 340,
              width: double.infinity,
              child: ListView.builder(
                  // padding: const EdgeInsets.only(right: 0.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const MediaCard(id: 1);
                  }),
            ),
            const SizedBox(
              width: double.infinity,
              height: 13,
            ),
            const Text(
              'LS',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(width: double.infinity, height: 10),
            SizedBox(
              height: 340,
              width: double.infinity,
              child: ListView.builder(
                  // padding: const EdgeInsets.only(right: 14.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const MediaCard(id: 1);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
