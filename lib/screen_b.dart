import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {
                selectedDate = await openDatePicker(context);
                setState(() {});
              },
              icon: const Icon(
                Icons.calendar_month_sharp,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              'Selected Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              style: const TextStyle(fontSize: 25, color: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }

  Future<DateTime> openDatePicker(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));
    return date ?? DateTime.now();
  }
}
