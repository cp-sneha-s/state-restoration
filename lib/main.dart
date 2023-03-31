import 'package:flutter/material.dart';
import 'package:state_restoration/screen_a.dart';
import 'package:state_restoration/screen_b.dart';

void main() {
  runApp(const MaterialApp(
      restorationScopeId: 'state-restoration', home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  final list = [const ScreenA(), const ScreenB()];
  final RestorableInt _selectedIndex = RestorableInt(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State restoration'),
        backgroundColor: Colors.blueGrey,
      ),
      body: list[_selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey[500],
        currentIndex: _selectedIndex.value,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen A'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Screen B')
        ],
      ),
    );
  }

  void onTap(int index) {
    if (_selectedIndex.value != index) {
      setState(() {
        _selectedIndex.value = index;
      });
    }
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => 'bottom-state';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedIndex, 'main');
  }
}
