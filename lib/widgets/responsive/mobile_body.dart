import 'package:flutter/material.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M O B I L E'),
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          //youtube video
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.deepPurple[400],
              ),
            ),
          ),
          //comment section & recommend videos
          Expanded(child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  color: Colors.deepPurple[300],
                  child: Text("index: $index"),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
