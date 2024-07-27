import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jellyone/main.dart';
import 'package:jellyone/theme/app_styles.dart';

class OnboardingScreen extends StatelessWidget {
  final _apiKeyController = TextEditingController();
  final _accessTokenController = TextEditingController();
  final _moviesFolderController = TextEditingController();
  final _showsFolderController = TextEditingController();
  final _introKey = GlobalKey<IntroductionScreenState>();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final pad = max((width - 700) / 2, 10.0);
    return DecoratedBox(
        decoration: const BoxDecoration(color: AppTheme.dark),
        child: Padding(
            padding: EdgeInsets.fromLTRB(pad, 40.0, pad, 0),
            child: IntroductionScreen(
              canProgress: (page) {
                if (page == 1 &&
                    (_apiKeyController.text.isEmpty ||
                        _accessTokenController.text.isEmpty)) {
                  return false;
                }
                return true;
              },
              key: _introKey,
              pages: [
                PageViewModel(
                  title: "Welcome to JellyOne 👋",
                  image: Image.asset('assets/images/movie_night.png'),
                  bodyWidget: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400.0),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  'JellyOne is serverless, crossplatform application that lets you manage and watch your media with a beautiful UI',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )))),
                  decoration: const PageDecoration(
                    pageColor: AppTheme.medium,
                  ),
                ),
                PageViewModel(
                  title: "TMDB credentials 🔑",
                  image:
                      Center(child: Image.asset('assets/images/security.png')),
                  bodyWidget: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _apiKeyController,
                              decoration: const InputDecoration(
                                labelText: "API Key",
                                border: OutlineInputBorder(),
                                isDense: true,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _accessTokenController,
                              decoration: const InputDecoration(
                                labelText: "Access Token",
                                border: OutlineInputBorder(),
                                isDense: true,
                              ),
                            ),
                          ],
                        ),
                      )),
                  decoration: const PageDecoration(
                    pageColor: AppTheme.medium,
                  ),
                ),
                PageViewModel(
                  title: "Media Folders 📂",
                  image:
                      Center(child: Image.asset('assets/images/searching.png')),
                  bodyWidget: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700.0),
                        child: Column(
                          children: [
                            const Text('Choose your media folders'),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _moviesFolderController,
                                    decoration: const InputDecoration(
                                      labelText: "Movie Folder",
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Material(
                                    color:
                                        const Color.fromRGBO(145, 215, 242, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: IconButton.filled(
                                        onPressed: () async {
                                          String? selectedDirectory =
                                              await FilePicker.platform
                                                  .getDirectoryPath();
                                          _moviesFolderController.text =
                                              selectedDirectory ??
                                                  'Invalid Selection';
                                        },
                                        icon: const Icon(Icons.folder)))
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _showsFolderController,
                                    decoration: const InputDecoration(
                                      labelText: "Shows Folder",
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Material(
                                    color:
                                        const Color.fromRGBO(145, 215, 242, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: IconButton.filled(
                                        onPressed: () async {
                                          String? selectedDirectory =
                                              await FilePicker.platform
                                                  .getDirectoryPath();
                                          _showsFolderController.text =
                                              selectedDirectory ??
                                                  'Invalid Selection';
                                        },
                                        icon: const Icon(Icons.folder)))
                              ],
                            ),
                            const SizedBox(height: 15),
                            const SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.warning_amber_rounded,
                                        color: Colors.red),
                                    Text(
                                        'Indexing all the media will take some time')
                                  ],
                                ))
                          ],
                        ),
                      )),
                  decoration: const PageDecoration(
                    pageColor: AppTheme.medium,
                  ),
                ),
              ],
              onDone: () async {
                var infoBox = await Hive.openBox('infoBox');
                infoBox.put('MOVIES_DIR', _moviesFolderController.text);
                infoBox.put('SHOWS_DIR', _showsFolderController.text);
                infoBox.put('API_KEY', _apiKeyController.text);
                infoBox.put('ACCESS_TOKEN', _accessTokenController.text);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MyHomePage()),
                );
              },
              dotsDecorator: const DotsDecorator(
                  activeColor: AppTheme.accent, activeSize: Size.square(13.0)),
              showSkipButton: false,
              showBackButton: true,
              back: const Icon(Icons.arrow_back),
              next: const Icon(Icons.arrow_forward),
              done: const Text("Done",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              backStyle: TextButton.styleFrom(
                  foregroundColor: AppTheme.accent,
                  side: const BorderSide(color: AppTheme.accent)),
              nextStyle: TextButton.styleFrom(
                  foregroundColor: AppTheme.text,
                  backgroundColor: AppTheme.accent),
              doneStyle: TextButton.styleFrom(
                  foregroundColor: AppTheme.text,
                  backgroundColor: AppTheme.accent),
            )));
  }
}
