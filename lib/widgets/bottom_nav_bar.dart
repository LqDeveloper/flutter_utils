import 'package:flutter/material.dart';

class TabItem {
  final Widget icon;
  final String? label;

  const TabItem({required this.icon, this.label});
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<TabItem> tabs;
  final ValueChanged<int>? onTap;
  final BottomNavigationBarThemeData themeData;

  const BottomNavBar(
      {Key? key,
      required this.currentIndex,
      required this.tabs,
      BottomNavigationBarThemeData? data,
      this.onTap})
      : assert(currentIndex < tabs.length && currentIndex >= 0),
        themeData = data ??
            const BottomNavigationBarThemeData(
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyle(fontSize: 12),
                unselectedLabelStyle: TextStyle(fontSize: 12),
                type: BottomNavigationBarType.fixed,
                elevation: 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarTheme(
      data: themeData,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        items: List.generate(tabs.length, (index) {
          return BottomNavigationBarItem(
              icon: tabs[index].icon, label: tabs[index].label);
        }),
        onTap: onTap,
      ),
    );
  }
}
