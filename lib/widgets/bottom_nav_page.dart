import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class BottomNavPage extends StatefulWidget {
  final List<TabItem> tabs;
  final BottomNavigationBarThemeData themeData;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final List<Widget> pages;

  const BottomNavPage(
      {Key? key,
      required this.tabs,
      required this.pages,
      int index = 0,
      this.onTap,
      BottomNavigationBarThemeData? data})
      : assert(tabs.length == pages.length),
        assert(tabs.length >= 2 && pages.length >= 2),
        assert(index < tabs.length && index >= 0),
        themeData = data ??
            const BottomNavigationBarThemeData(
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyle(fontSize: 12),
                unselectedLabelStyle: TextStyle(fontSize: 12),
                type: BottomNavigationBarType.fixed,
                elevation: 5),
        currentIndex = index,
        super(key: key);

  @override
  State<BottomNavPage> createState() => BottomNavPageState();

  static BottomNavPageState of(BuildContext context) {
    final BottomNavPageState? result =
        context.findAncestorStateOfType<BottomNavPageState>();
    if (result != null) {
      return result;
    }
    throw FlutterError("can not get BottomNavPageState");
  }
}

class BottomNavPageState extends State<BottomNavPage> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          itemBuilder: (cxt, index) => widget.pages[index],
          controller: _pageController,
          itemCount: widget.tabs.length,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          tabs: widget.tabs,
          data: widget.themeData,
          onTap: jumpToPage,
        ));
  }

  void jumpToPage(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
  }
}
