import 'dart:io';
import 'dart:isolate';

import 'package:jellyone/db/db.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:jellyone/screens/home.dart';
import 'package:jellyone/screens/movies.dart';
import 'package:jellyone/screens/onboarding.dart';
import 'package:jellyone/screens/settings.dart';
import 'package:jellyone/screens/shows.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:jellyone/utils/udpate_media.dart';

import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

void main() async {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  Directory dir = await getApplicationSupportDirectory();
  await dotenv.load(fileName: ".env");

  String hiveStorageLocation = p.join(dir.path, 'hive');
  await Hive.initFlutter(hiveStorageLocation);

  String imageStorageLocation = p.join(dir.path, 'cache', 'images');
  await FastCachedImageConfig.init(
      subDir: imageStorageLocation, clearCacheAfter: const Duration(days: 60));

  var infoBox = await Hive.openBox('infoBox');
  if (infoBox.get('onboarding') == null) {
    infoBox.put('onboarding', 1);
    runApp(const MyApp(onboarding: 0));
  } else {
    runApp(const MyApp(onboarding: 1));
  }
}

class MyApp extends StatelessWidget {
  final int onboarding;

  const MyApp({super.key, required this.onboarding});

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
      home: onboarding == 0 ? OnboardingScreen() : const MyHomePage(),
      // home: const MyHomePage(),
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

  void startIsolate() async {
    var infoBox = await Hive.openBox('infoBox');

    final envVars = {
      'MOVIES_DIR': infoBox.get('MOVIES_DIR') ?? dotenv.get('MOVIES_DIR'),
      'SHOWS_DIR': infoBox.get('SHOWS_DIR') ?? dotenv.get('SHOWS_DIR'),
      'ACCESS_TOKEN': infoBox.get('ACCESS_TOKEN') ?? dotenv.get('ACCESS_TOKEN'),
      'API_KEY': infoBox.get('API_KEY') ?? dotenv.get('API_KEY'),
    };
    final isolate = await createDBIsolate();
    Isolate.spawn(updateMedia, [envVars, isolate]);
  }

  @override
  void initState() {
    super.initState();
    // Start the isolate after the UI is displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startIsolate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JellyOne'),
        centerTitle: true,
        backgroundColor: AppTheme.medium,
        elevation: 1,
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
      backgroundColor: AppTheme.dark,
      indicatorColor: Color.fromARGB(179, 30, 161, 204),
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
      default:
        return const HomeScreen();
    }
  }
}
