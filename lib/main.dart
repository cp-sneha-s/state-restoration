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
  final list = [const ScreenA(), const ScreenB()];
  int _selectedIndex = 0;

  void onTap(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen A'),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet), label: 'Screen B')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: list[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: onTap,
            items: bottomNavigationBarItems),
      ),
    );
  }
}
