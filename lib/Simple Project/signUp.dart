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
  final _emailcontroller = TextEditingController();
  final _psswrdcontroller = TextEditingController();
  String? _emailerrorText;
  String? _surerrorText;
  String? _firstnameerrorText;
  String? _lastnameerrotText;
  String? _psswrderrorText;
  String? _mailerrorText = "Invalid mail";
  bool? _uppercase= false;
  bool? _lowercase= false;
  bool? _spcharacter= false;
  bool? _numb= false;
  bool? _length;

  void _validInput(){
    setState(() {
      _surerrorText = _surnamecontroller.text.isEmpty ? "This field is required":null;
      _firstnameerrorText = _firstnamecontroller.text.isEmpty ? "This field is required" : null;
      _lastnameerrotText = _lastnamecontroller.text.isEmpty ? "This field is required" : null;
      _emailerrorText = _emailcontroller.text.isEmpty ? "This field is requirered": null;
    });

    if(_surnamecontroller.text.isEmpty || _firstnamecontroller.text.isEmpty || _lastnamecontroller.text.isEmpty){
      _surerrorText;
      _firstnameerrorText;
      _lastnameerrotText;
    }
  }

  void validateEmail() {
    String email = _emailcontroller.text.trim();
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email.isEmpty) {
      _emailerrorText;
    } else if (!emailRegex.hasMatch(email)) {
      _mailerrorText;
    } else {
      null;
    }
  }

  void _validatepsswrd(String psswrd){
    setState(() {
      _psswrderrorText = _psswrdcontroller.text.isEmpty ? "Enter your Password" : null;
      _uppercase = psswrd.contains(RegExp(r'[A-Z]'));
      _lowercase = psswrd.contains(RegExp(r'[a-z]'));
      _spcharacter = psswrd.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'));
      _numb = psswrd.contains(RegExp(r'[1234567890]'));
      _length = psswrd.length>=8;
    });
    if (_psswrdcontroller.text == null || _psswrdcontroller.text.isEmpty) {
      _psswrderrorText;
    }
  }
  Widget _psswrdRequirement(bool psswrd,String text){
    return Row(
      children: [
        Icon(
          psswrd ? Icons.check_circle : Icons.cancel,
          color: psswrd ? Colors.indigo : Colors.red,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // appBar: AppBar(),
      backgroundColor: Colors.purple[100],
      body: SafeArea(child: Stack(
        children: [
          Align(
            alignment: const Alignment(-085, -0.75),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const myApp()));
            }, icon: Image.asset('assets/images/back_Arr.png',width: 53,)),
          ),
          ListView(
            children: [
              Container(
                child: Container(
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
                            const Text("Username",style: TextStyle(
                              color: Colors.blueAccent,
                            ),),
                            TextField(
                              controller: _surnamecontroller,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'USername',
                                  errorText: _surerrorText
                              ),
                            ),
                            const Text("First Name",style: TextStyle(
                              color: Colors.blueAccent,
                            ),),
                            TextField(
                              controller: _firstnamecontroller,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Surname',
                                errorText: _firstnameerrorText,
                              ),
                            ),
                            const Text('Last Name',style: TextStyle(
                              color: Colors.blueAccent,
                            ),),
                            TextField(
                              controller: _lastnamecontroller,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'last Name',
                                errorText: _lastnameerrotText,
                              ),
                            ),
                            const Text('Email',style: TextStyle(
                              color: Colors.blueAccent,
                            ),),
                            TextField(
                              controller: _emailcontroller,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: '',
                                errorText:_emailerrorText,
                              ),
                            ),
                            TextField(
                              controller: _psswrdcontroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                errorText:_psswrderrorText,
                              ),
                              onChanged: _validatepsswrd,
                            ),
                            _psswrdRequirement(_length!, "Password must be at least 8 characters"),
                            _psswrdRequirement(_uppercase!,"At least 1Uppercase"),
                            _psswrdRequirement(_lowercase!, "At least 1 lowercase"),
                            _psswrdRequirement(_spcharacter!, "Add some special characters"),
                            _psswrdRequirement(_numb!, "At least one Number")

                          ],
                        )),
                  ),
                )
              )
            ],
          )
          ],
            ),
          )
      );
  }
}