import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const  String Title = "First App";
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title:const Text(Title),),
        drawer: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:[Colors.red,Colors.yellow],
                begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
                child:Text(
                  "Drawer Header",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            )
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.indigoAccent),
              child: ListTile(
                title: const Text("About"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text("Help"),
              onTap: ()=> Navigator.pop(context),
            )
          ],
        )
      ),
    );
  }

}
