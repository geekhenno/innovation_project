import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_project/core/constants/app_locale.dart';
import 'package:innovation_project/core/extensions/theme_extension.dart';
import 'package:innovation_project/features/home/views/screens/home_view.dart';
import 'package:innovation_project/features/main/models/bottom_item_data.dart';
import 'package:innovation_project/features/more/views/screens/more_view.dart';
import 'package:innovation_project/generated/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<BottomItemData> _items = [
      BottomItemData(
        view: const HomeView(),
        selectedIcon: Assets.iconsIcHomeFilled,
        unSelectedIcon: Assets.iconsIcHome,
        title: AppLocale.home.tr(context: context),
      ),
      BottomItemData(
        view: const MoreView(),
        selectedIcon: Assets.iconsIcMoreFilled,
        unSelectedIcon: Assets.iconsIcMore,
        title: AppLocale.more.tr(context: context),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _items[_currentIndex].title,
          style: TextStyle(color: context.theme.primaryColor),
        ),
        centerTitle: true,
      ),
      body: _items[_currentIndex].view,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: _items[0].title,
            icon: SvgPicture.asset(
              _currentIndex == 0
                  ? _items[0].selectedIcon
                  : _items[0].unSelectedIcon,
            ),
          ),
          BottomNavigationBarItem(
            label: _items[1].title,
            icon: SvgPicture.asset(
              _currentIndex == 1
                  ? _items[1].selectedIcon
                  : _items[1].unSelectedIcon,
            ),
          ),
        ],
      ),
    );
  }
}
