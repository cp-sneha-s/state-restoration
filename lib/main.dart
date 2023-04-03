import 'package:flutter/material.dart';
import 'package:state_restoration/screen_a.dart';
import 'package:state_restoration/screen_b.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen A'),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet), label: 'Screen B')
  ];

  void onTap(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final PageStorageBucket _bucket = PageStorageBucket();
  final screens = [
    const ScreenA(
      key: PageStorageKey<String>('Screen-A'),
    ),
    const ScreenB(
      key: PageStorageKey<String>('Screen-B'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageStorage(bucket: _bucket, child: screens[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: onTap,
            items: bottomNavigationBarItems),
      ),
    );
  }
}
