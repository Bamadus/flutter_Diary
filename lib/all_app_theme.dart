import 'package:flutter/material.dart';

void main(){
  runApp(const theme());
}
class theme extends StatefulWidget{
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  bool isDark=true;
  changeBackground(){
    print('ooooooooooooooo');
    setState(() {
      !isDark;
    });
  }
  @override
  Widget build(BuildContext context) {
    const title = '...';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        //theme: ThemeData.dark()
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple,
              brightness: isDark?Brightness.dark:Brightness.light
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
      home: Home(changeBackground),

    );
}
}

class Home extends StatelessWidget{
   Home(Function? changeBackground,  {
    super.key,
  });

  get changeBackground => changeBackground;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("hell"),),
      body: Center(child: InkWell(onTap:()=>changeBackground, child: Text("Click Me Now")),),
        );
  }
}


// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Align(
// alignment:Alignment.topCenter,
// child: ElevatedButton(onPressed:(){
// Navigator.push(context, MaterialPageRoute(builder:(context)=> const Integrated() ));
// }, child: const Text('Home')),
// ),
// )

//
// appBar: AppBar(title: const Text('App Theme Setting',style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 19,
// fontStyle: FontStyle.italic
// )),),
// body: Container(
// //margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 19),
// child: Center(
// child: Row(
// children: [
// ElevatedButton(onPressed:(){
// Navigator.push(context, MaterialPageRoute(builder:(context)=>const myTheme()));
// }, child: const Text('Dark Theme')),
//
// const Spacer(),
//
// ElevatedButton(onPressed:(){
// Navigator.push(context, MaterialPageRoute(builder:(context)=> const Integrated()));
// }, child: const Text('Light Theme')),
// ],
// ),
//
//
// )
// )
// ),
// // );
//
// Scaffold(
// backgroundColor: Colors.purple[100],
// body: SafeArea(
// child: Stack(
// children: [
// // Back Button at Top-Left
// Align(
// alignment: Alignment.topLeft,
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: IconButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (_) => const myApp()),
// );
// },
// icon: Image.asset('assets/images/back_Arr.png', width: 53),
// ),
// ),
// ),
//
// // Center Widget
// Align(
// alignment: Alignment.center,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: const [
// Icon(Icons.star, size: 50, color: Colors.deepPurple),
// SizedBox(height: 10),


// Container(
// alignment: Alignment(-0.85,-0.75),
// child: IconButton(onPressed: (){
// Navigator.push(context, MaterialPageRoute(builder: (context)=> const myApp()));
// }, icon: Image.asset('assets/images/back_Arr.png',width: 53,)
// ),
// ),


// Align(
// alignment: const Alignment(-0.85, -0.75),
// child: IconButton(onPressed: (){
// Navigator.push(context, MaterialPageRoute(builder: (context)=> const myApp()));
// }, icon: Image.asset('assets/images/back_Arr.png', width: 53,)),),


