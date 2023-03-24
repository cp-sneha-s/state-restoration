import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Screen B'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Center(
            child: Icon(
              Icons.gcalendar_month_sharp,
              size: 50,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            'Selected Date',
            style: TextStyle(fontSize: 25, color: Colors.blueGrey),
          )
        ],
      ),
    );
  }
}
