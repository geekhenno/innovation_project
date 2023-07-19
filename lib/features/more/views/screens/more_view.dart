import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovation_project/core/config/app_dimensions.dart';
import 'package:innovation_project/core/config/theme/theme_provider.dart';
import 'package:innovation_project/core/constants/app_locale.dart';
import 'package:innovation_project/core/extensions/theme_extension.dart';
import 'package:innovation_project/core/services/shared_pref/pref_keys.dart';
import 'package:innovation_project/core/services/shared_pref/shared_pref.dart';

class MoreView extends StatefulWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  late bool _switchLanguage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _switchLanguage = context.locale == const Locale('ar');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.settings.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Consumer(builder: (context, ref, child) {
            return SwitchListTile.adaptive(
              activeColor: context.theme.primaryColor,
              value: ref.watch(themeProvider),
              onChanged: (value) {
                ref.read(themeProvider.notifier).state = value;
                ref.read(sharedPrefProvider).setBool(PrefKeys.themeMode, value);
              },
              title: Text(AppLocale.darkMode.tr()),
            );
          }),
          SwitchListTile.adaptive(
            activeColor: context.theme.primaryColor,
            value: _switchLanguage,
            onChanged: (value) {
              if (value) {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
              setState(() {
                _switchLanguage = value;
              });
            },
            title: Text(AppLocale.lang.tr()),
          ),
        ],
      ),
    );
  }
}
