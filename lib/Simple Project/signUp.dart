import 'package:flutter/material.dart';
import 'package:itcooking/Simple Project/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.purple[100],
        body:ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 55),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
            }, icon: Image.asset('assets/images/back_Arr.png', width: 53,)),
          ),
          ],
        ),
        );



  }
}
