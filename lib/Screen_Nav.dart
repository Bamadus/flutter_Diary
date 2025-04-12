import 'package:flutter/material.dart';

void main() {
  runApp(const screen_nav());
}
// the app isn't switching from screen to screen

class screen_nav extends StatelessWidget {
  const screen_nav({super.key});
  static const title = "Screen Nav...";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: Center(
              child: ElevatedButton(
            child: const Text('Open Route 1'),
            onPressed: (){
              Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const sec_screen()));
            },
          )),
        ));
  }
}

class sec_screen extends StatelessWidget {
  const sec_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Second Screen!")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go back!!"),
          ),
        ));
  }
}
