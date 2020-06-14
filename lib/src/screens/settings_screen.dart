import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pickNotification = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          )),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Languages',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Reminder',
            tiles: [
              SettingsTile(
                title: 'Pick up reminder',
                subtitle: 'Currently set to 1 KM before pick up spot',
                leading: Icon(Icons.pin_drop),
                onTap: () {
                  print('clicked!');
                },
              ),
              SettingsTile(
                title: 'Drop reminder',
                subtitle: 'Currently set to 1 KM before drop spot',
                leading: Icon(Icons.pin_drop),
              ),
            ],
          ),
          SettingsSection(
            title: 'Notifications',
            tiles: [
              SettingsTile.switchTile(
                title: 'Pick up notifications',
                subtitle: 'When bus reached at pick up reminder spot',
                switchValue: pickNotification,
                onToggle: (bool value) {
                  setState(() {
                    pickNotification = value;
                    notificationsEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Drop notification',
                  subtitle: 'When bus reached at pick up reminder spot',
                  onToggle: (bool value) {},
                  switchValue: false),
              SettingsTile.switchTile(
                title: 'Reached at School',
                subtitle: 'When student gets at school',
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Enable Notifications',
                leading: Icon(Icons.notifications_active),
                switchValue: notificationsEnabled,
                onToggle: (value) {
                  notificationsEnabled = value;
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          )
        ],
      ),
    );
  }
}
