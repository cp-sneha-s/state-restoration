import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> with AutomaticKeepAliveClientMixin {
  late final TextEditingController controller;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          controller: controller,
          maxLines: 10,
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(15),
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            hintText: 'Enter some text',
          ),
        ),
      ),
    );
  }
}
