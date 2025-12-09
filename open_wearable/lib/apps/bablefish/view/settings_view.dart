import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/model/languages.dart';
import 'package:open_wearable/apps/bablefish/model/user_settings_model.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_primary.dart';
import 'package:open_wearable/apps/bablefish/view_model/bablefish_view_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final TextEditingController _usernameController;
  late Languages _selectedLanguage;
  late double _currentVolume;

  @override
  void initState() {
    super.initState();
    // Load initial values from the ViewModel without listening to changes
    final bablefishViewModel =
        Provider.of<BablefishViewModel>(context, listen: false);
    _usernameController = TextEditingController(
      text: bablefishViewModel.userSettings.username,
    );
    _selectedLanguage = bablefishViewModel.userSettings.language;
    _currentVolume = bablefishViewModel.userSettings.ttsVolume.toDouble();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _saveSettings() {
    final bablefishViewModel =
        Provider.of<BablefishViewModel>(context, listen: false);

    // Create new settings object from the UI controls
    final newSettings = UserSettings(
      username: _usernameController.text,
      language: _selectedLanguage,
      ttsVolume: _currentVolume.round(),
    );

    // Update settings via the ViewModel, which handles saving
    bablefishViewModel.updateSettings(newSettings);
    Navigator.of(context).pop();
  }

  // Helper to get a display-friendly string from the enum
  String _displayLanguage(Languages language) {
    return language.name[0].toUpperCase() + language.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              'Profile Settings',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            // Username Text Field
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),

            Text(
              'Language & Region',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Language Autocomplete Field
            Autocomplete<Languages>(
              displayStringForOption: _displayLanguage,
              initialValue: TextEditingValue(
                text: _displayLanguage(_selectedLanguage),
              ),
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<Languages>.empty();
                }
                return Languages.values.where((Languages option) {
                  return option.name
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (Languages selection) {
                setState(() {
                  _selectedLanguage = selection;
                });
                FocusScope.of(context).unfocus();
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return TextFormField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  decoration: const InputDecoration(
                    labelText: 'Language',
                    prefixIcon: Icon(Icons.language_outlined),
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),

            Text(
              'Audio Settings',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Volume Slider
            Row(
              children: [
                const Icon(Icons.volume_down),
                Expanded(
                  child: Slider(
                    value: _currentVolume,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _currentVolume.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentVolume = value;
                      });
                    },
                  ),
                ),
                const Icon(Icons.volume_up),
              ],
            ),
            // This part stays at the bottom and is not scrollable
            const SizedBox(height: 100),
            PrimaryButton(onPressed: _saveSettings, text: 'Save Changes'),
            const SizedBox(height: 24), // Padding at the very bottom
          ],
        ),
      ),
    );
  }
}
