import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();

    controller.text = PageStorage.of(context)
            .readState(context, identifier: const PageStorageKey('Screen B')) ??
        '';
    controller.addListener(() {
      PageStorage.of(context).writeState(context, controller.text,
          identifier: const PageStorageKey('Screen B'));
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen B'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          controller: controller,
          maxLines: 10,
          decoration: InputDecoration(
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
