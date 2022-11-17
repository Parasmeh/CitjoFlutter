import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Theme/app_colors.dart';
import 'thememanager.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Text("Profile Section",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.merge(const TextStyle())),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SettingsOption(
                title: 'Light Mode',
                icon: Icons.light_mode,
                onPress: () => {
                  theme.setLightMode(),
                },
              ),
              const Divider(thickness: 1.0),
              SettingsOption(
                title: 'Dark Mode',
                icon: Icons.dark_mode,
                onPress: () => {
                  theme.setDarkMode(),
                },
              ),
              const Divider(thickness: 1.0),
            ]),
          ),
        ),
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const SettingsOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 24),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.merge(const TextStyle()),
          ),
        ],
      ),
    );
  }
}
