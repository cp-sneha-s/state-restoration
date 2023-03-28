import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('PageA ' +
    //     PageStorage.of(context)
    //         .readState(context,
    //             identifier: const PageStorageKey<String>('Screen-A'))
    //         .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen A'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
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
            itemCount: 100),
      ),
    );
  }
}
