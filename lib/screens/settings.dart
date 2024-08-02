import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:path_provider/path_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String moviesFolder = '';
  String showsFolder = '';
  String apiKey = '';
  String accessTokenString = '';
  bool isApiKeyStringHidden = false;
  bool isAccessTokenStringHidden = false;
  String appSupportDir = '';

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _getApplicationSupportDirectory();
  }

  Future<void> _loadSettings() async {
    var box = await Hive.openBox('infoBox');
    setState(() {
      moviesFolder = box.get('MOVIES_DIR');
      showsFolder = box.get('SHOWS_DIR');
      apiKey = box.get('API_KEY');
      accessTokenString = box.get('ACCESS_TOKEN');
      isApiKeyStringHidden = true;
      isAccessTokenStringHidden = true;
    });
  }

  Future<void> _getApplicationSupportDirectory() async {
    final directory = await getApplicationSupportDirectory();
    setState(() {
      appSupportDir = directory.path;
    });
  }

  Future<void> _pickFolder(String key) async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    print(selectedDirectory);
    if (selectedDirectory != null) {
      var box = await Hive.openBox('infoBox');
      box.put(key, selectedDirectory);
      setState(() {
        if (key == 'MOVIES_DIR') {
          moviesFolder = selectedDirectory;
        } else if (key == 'SHOWS_DIR') {
          showsFolder = selectedDirectory;
        }
      });
    }
  }

  Future<void> _updateSetting(String key, String value) async {
    var box = await Hive.openBox('infoBox');
    box.put(key, value);
  }

  Future<void> _clearCache() async {
    await FastCachedImageConfig.clearAllCachedImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: AppTheme.text)),
        // backgroundColor: AppTheme.accent,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Change Movies Folder',
                  style: TextStyle(color: AppTheme.text)),
              subtitle: Text(moviesFolder,
                  style: const TextStyle(color: AppTheme.subText)),
              trailing: IconButton(
                  icon: const Icon(Icons.folder_open, color: AppTheme.accent),
                  onPressed: () => _pickFolder('MOVIES_DIR')),
            ),
            ListTile(
              title: const Text('Change Shows Folder',
                  style: TextStyle(color: AppTheme.text)),
              subtitle: Text(showsFolder,
                  style: const TextStyle(color: AppTheme.subText)),
              trailing: IconButton(
                  icon: const Icon(Icons.folder_open, color: AppTheme.accent),
                  onPressed: () => _pickFolder('SHOWS_DIR')),
            ),
            ListTile(
              title:
                  const Text('API Key', style: TextStyle(color: AppTheme.text)),
              subtitle: isApiKeyStringHidden
                  ? const Text('Hidden',
                      style: TextStyle(color: AppTheme.subText))
                  : TextField(
                      controller: TextEditingController(text: apiKey),
                      onChanged: (value) {
                        setState(() {
                          apiKey = value;
                        });
                        _updateSetting('apiKey', value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter API Key',
                        hintStyle: TextStyle(color: AppTheme.subText),
                      ),
                      style: const TextStyle(color: AppTheme.subText),
                    ),
              trailing: IconButton(
                icon: Icon(
                  isApiKeyStringHidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppTheme.accent,
                ),
                onPressed: () async {
                  setState(() {
                    isApiKeyStringHidden = !isApiKeyStringHidden;
                    _updateSetting('isApiKeyStringHidden',
                        isApiKeyStringHidden.toString());
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Access Token String',
                  style: TextStyle(color: AppTheme.text)),
              subtitle: isAccessTokenStringHidden
                  ? const Text('Hidden',
                      style: TextStyle(color: AppTheme.subText))
                  : TextField(
                      controller:
                          TextEditingController(text: accessTokenString),
                      onChanged: (value) {
                        setState(() {
                          accessTokenString = value;
                        });
                        _updateSetting('accessTokenString', value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Access Token',
                        hintStyle: TextStyle(color: AppTheme.subText),
                      ),
                      style: const TextStyle(color: AppTheme.subText),
                    ),
              trailing: IconButton(
                icon: Icon(
                  isAccessTokenStringHidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppTheme.accent,
                ),
                onPressed: () async {
                  setState(() {
                    isAccessTokenStringHidden = !isAccessTokenStringHidden;
                    _updateSetting('isAccessTokenStringHidden',
                        isAccessTokenStringHidden.toString());
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Cache',
                style: TextStyle(color: AppTheme.text, fontSize: 20)),
            const SizedBox(height: 15),
            ListTile(
                title: const Text('Clear Cached Images',
                    style: TextStyle(color: AppTheme.text)),
                trailing: IconButton(
                    icon: const Icon(Icons.delete, color: AppTheme.accent),
                    onPressed: () => _clearCache)),
            ListTile(
              title: const Text('Cache Directory',
                  style: TextStyle(color: AppTheme.text)),
              subtitle: Text(appSupportDir,
                  style: const TextStyle(color: AppTheme.subText)),
            ),
          ],
        ),
      ),
    );
  }
}
