import 'package:flutter/material.dart';
import 'package:itcooking/Simple Project/Login.dart';

class sign extends StatefulWidget{
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final GlobalKey<FormState> _signkey = GlobalKey<FormState>();
  final _surnamecontroller = TextEditingController();
  final _firstnamecontroller= TextEditingController();
  final _lastnamecontroller = TextEditingController();
  String? _surerrorText;
  String? _firstnameerrorText;
  String? _lastnameerrotText;

  void _validInput(){
    setState(() {
      _surerrorText = _surnamecontroller.text.isEmpty ? "This field is required":null;
      _firstnameerrorText = _firstnamecontroller.text.isEmpty ? "This field is required" : null;
      _lastnameerrotText = _lastnamecontroller.text.isEmpty ? "This field is required" : null;
    });

    if(_surnamecontroller.text.isEmpty || _firstnamecontroller.text.isEmpty || _lastnamecontroller.text.isEmpty){
      _surerrorText;
      _firstnameerrorText;
      _lastnameerrotText;
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Center(
              child: Form(
                key: _signkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Create Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.blue[900],
                        ),
                      ),
                      Text("Please fill the inputs below",
                        style: TextStyle(
                          fontSize: 21,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue[900],
                        ),
                      ),
                      const SizedBox(height: 85,),
                      const Text("Surname"),
                      TextField(
                        controller: _surnamecontroller,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Surname',
                            errorText: _surerrorText
                        ),
                      ),
                      const Text("First Name"),
                      TextField(
                        controller: _firstnamecontroller,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Surname',
                            errorText: _firstnameerrorText,
                        ),
                      ),
                      const Text('Last Name'),
                      TextField(
                        controller: _lastnamecontroller,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'last Name',
                          errorText: _lastnameerrotText,
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