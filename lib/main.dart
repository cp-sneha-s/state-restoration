import 'package:flutter/material.dart';
import 'package:state_restoration/screen_a.dart';
import 'package:state_restoration/screen_b.dart';

void main() {
  runApp(const BottomNavigationBarControllerPage());
}

class BottomNavigationBarControllerPage extends StatefulWidget {
  const BottomNavigationBarControllerPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarControllerPage> createState() =>
      _BottomNavigationBarControllerPageState();
}

class _BottomNavigationBarControllerPageState
    extends State<BottomNavigationBarControllerPage> {
  final PageStorageBucket _bucket = PageStorageBucket();
  final screens = [
    const ScreenA(
      key: PageStorageKey<String>('Screen-A'),
    ),
    const ScreenB(
      key: PageStorageKey<String>('Screen-B'),
    )
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageStorage(bucket: _bucket, child: screens[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen A'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet), label: 'Screen B')
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
