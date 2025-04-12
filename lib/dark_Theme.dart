import 'package:flutter/material.dart';
import 'package:itcooking/all_app_theme.dart';
import 'package:itcooking/light_theme2.dart';
import 'package:itcooking/Integrated.dart';

class myTheme extends StatelessWidget{
  const myTheme({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "My App Theme";
    return MaterialApp(
      title: title,
      // initialRoute: 'Dark_Theme',
      // routes: {
      //   'Dark_Theme': (context)=> const myTheme(),
      //   'Light_Theme': (context)=> const Sec_screen(),
      // },
      theme: ThemeData(
        //theme: ThemeData.dark()
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72,
              fontWeight: FontWeight.bold,
          ),
        )
           ),
        home: const Screen()

      );
  }
  }

class Screen extends StatelessWidget{
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text("Dark Theme Setting",
         style: TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.bold,
           fontSize: 19,
           fontStyle: FontStyle.italic
         ),),),
     body: Center(
       child: Row(
         children: [
           ElevatedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const Sec_screen()));
               }, child: const Text("Light Theme!!")),

           ElevatedButton(onPressed:(){
             Navigator.push(context, MaterialPageRoute(builder:(context)=> Integrated()));
           }, child: const Text('Go Back'))
         ],
       ),
     ),
   );
  }
}

