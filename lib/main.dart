import 'dart:isolate';

import 'package:jellyone/db/db.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:jellyone/screens/home.dart';
import 'package:jellyone/screens/info.dart';
import 'package:jellyone/screens/movies.dart';
import 'package:jellyone/screens/settings.dart';
import 'package:jellyone/screens/shows.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:jellyone/utils/udpate_media.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  final envVars = {
    'MOVIES_DIR': dotenv.get('MOVIES_DIR'),
    'SHOWS_DIR': dotenv.get('SHOWS_DIR'),
    'ACCESS_TOKEN': dotenv.get('ACCESS_TOKEN'),
    'API_KEY': dotenv.get('API_KEY'),
  };

  runApp(const MyApp());

  final isolate = await createDBIsolate();
  Isolate.spawn(updateMedia, [envVars, isolate]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JellyOne',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.accent,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppTheme.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int id = 843527;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JellyOne'),
      ),
      body: Row(
        children: [
          navRail(),
          Expanded(
            child: buildMainScreen(),
          )
        ],
      ),
    );
  }

  NavigationRail navRail() {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.all,
      groupAlignment: 0,
      destinations: const [
        NavigationRailDestination(
            icon: Icon(
              Icons.home_outlined,
              size: 30.0,
            ),
            selectedIcon: Icon(
              Icons.home,
              size: 30.0,
            ),
            label: Text('Home'),
            padding: EdgeInsets.all(10.0)),
        NavigationRailDestination(
            icon: Icon(
              Icons.movie_outlined,
              size: 30.0,
            ),
            selectedIcon: Icon(
              Icons.movie_rounded,
              size: 30.0,
            ),
            label: Text('Movie'),
            padding: EdgeInsets.all(10.0)),
        NavigationRailDestination(
          icon: Icon(
            Icons.tv_outlined,
            size: 30.0,
          ),
          selectedIcon: Icon(
            Icons.tv,
            size: 30.0,
          ),
          label: Text('Shows'),
          padding: EdgeInsets.all(10.0),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.settings_outlined,
            size: 30.0,
          ),
          selectedIcon: Icon(
            Icons.settings,
            size: 30.0,
          ),
          label: Text('Settings'),
          padding: EdgeInsets.all(10.0),
        ),
      ],
    );
  }

  Widget buildMainScreen() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const MoviesScreen();
      case 2:
        return const ShowsScreen();
      case 3:
        return const SettingsScreen();
      case 4:
        return MediaInfoScreen(id: id);
      default:
        return const HomeScreen();
    }
  }
}
