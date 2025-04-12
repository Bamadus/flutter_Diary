import 'package:flutter/Material.dart';
import 'package:itcooking/dark_Theme.dart';
import 'package:itcooking/all_app_theme.dart';


class Sec_screen extends StatelessWidget{
  const Sec_screen({super.key});

  @override
  Widget build(BuildContext context) {
    const title='Sec screen';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        )
      ),
      home: const Screen(),
    );
  }

  }

class Screen extends StatelessWidget  {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(
        "Light Theme Screen",
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 19),),),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const theme()));
            }, child: const Text('Go Back!')),
      ),
    );
  }
}
