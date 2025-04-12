import 'package:flutter/material.dart';
import 'package:itcooking/Gridview.dart';
import 'package:itcooking/all_app_theme.dart';


void main(){
  runApp( Integrated());
}

class Integrated extends StatelessWidget{
   Integrated({super.key});

 final  String title = 'All!!';

  bool themeValue = false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        //brightness: changeTheme.getBrightness(themeValue),

      ),


      //initialRoute: 'first_Screen',
      title: title,
      home:  Scaffold(
        body: first_Screen(themeValue:themeValue),
      )
    );
  }
}

class first_Screen extends StatefulWidget{
   first_Screen({required this.themeValue});
  bool themeValue=false;

  @override
  State<first_Screen> createState() => _first_ScreenState();
}

class _first_ScreenState extends State<first_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Dairy"),
        backgroundColor: Colors.limeAccent,
      ),
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.limeAccent, Colors.lime],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                  ),
              ),
              child: Center(
                child: Text("Others!",
                  style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black38
                  ),),
              )
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black26 ),
            child: ListTile(
              title: const Text('Dark Mode',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white
              ),),

              onTap: (){
                setState(() {
                  bool darkMode=!widget.themeValue;
                  ChangeTheme().getBrightness(darkMode);
                });

              },
            ),
          )
        ],
      ),
      body: const Gridview(),
    );

  }
}

class ChangeTheme{
   Brightness getBrightness(bool isDarkMode){
     print(isDarkMode);
    return isDarkMode ? Brightness.dark : Brightness.light;
  }
}