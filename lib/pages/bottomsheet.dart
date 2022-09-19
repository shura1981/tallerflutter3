import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Sheet")),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                const FlutterLogo(size: 120,),
                const FlutterLogo(size: 120,),
                const FlutterLogo(size: 120,),
                const FlutterLogo(size: 120,),
                ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("close"))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Text("Open Bottom Sheet"),
      )),
    );
  }
}
