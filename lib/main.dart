import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovation_project/core/config/theme/theme.dart';
import 'package:innovation_project/core/config/theme/theme_provider.dart';
import 'package:innovation_project/core/services/shared_pref/pref_keys.dart';
import 'package:innovation_project/core/services/shared_pref/shared_pref.dart';
import 'package:innovation_project/features/main/views/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isDarkTheme = prefs.getBool(PrefKeys.themeMode) ?? false;

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/localization',
      fallbackLocale: const Locale('en'),
      child: ProviderScope(
        overrides: [
          sharedPrefProvider.overrideWithValue(prefs),
          themeProvider.overrideWith((ref) => isDarkTheme),
        ],
        child: MyApp(
          isDarkTheme: isDarkTheme,
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final bool isDarkTheme;
  const MyApp({
    super.key,
    required this.isDarkTheme,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Innovation Project',
      theme:
          ref.watch(themeProvider) ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}
