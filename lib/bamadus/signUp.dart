import 'package:flutter/material.dart';
import 'package:itcooking/bamadus/Login.dart';

class sign extends StatefulWidget{
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final GlobalKey<FormState> _signkey = GlobalKey<FormState>();
  final _surnamecontroller = TextEditingController();
  String? _surerrorText;

  void _validInput(){
    setState(() {
      _surerrorText = _surnamecontroller.text.isEmpty ? "Enter your Surname":null;
    });

    if(_surnamecontroller.text.isEmpty == true){
      _surerrorText;
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // appBar: AppBar(),
      backgroundColor: Colors.purple[100],
      body: SafeArea(child: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.85, -0.75),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const myApp()));
            }, icon: Image.asset('assets/images/back_Arr.png', width: 53,)),),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Form(
                key: _signkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _surnamecontroller,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Surname',
                            errorText: _surerrorText
                        ),
                      ),
                    ],
                  )),
                ),
          )],
            ),
          )
      );
  }
}