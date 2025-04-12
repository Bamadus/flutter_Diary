import 'package:flutter/material.dart';

void main(){
  runApp(const SnackBarApp());
}

class SnackBarApp extends StatelessWidget{
  const SnackBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Snack Bar",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Snack on App"),
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget{
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: (){
            var snackBar = SnackBar(
              content: const Text("Yay!! SnackBar!!"),
              action: SnackBarAction(
                  label: 'Undo',
                  onPressed: (){
                    // code to undo the action or perform the label
              }
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }, child: const Text('SHow SnackBar')),
    );
  }
}

//another way to show a snack bar

// ScaffoldMessenger.of(
// context,
// ).showSnackBar(const SnackBar(content: Text('Tap')));