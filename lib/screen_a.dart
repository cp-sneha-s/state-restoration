import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.yellow,
              title: Center(child: Text('Item $index')),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
        ),
      ),
    );
  }
}
