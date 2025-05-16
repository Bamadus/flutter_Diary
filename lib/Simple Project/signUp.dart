import 'package:flutter/material.dart';
import 'package:itcooking/Simple Project/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signkey = GlobalKey<FormState>();

  final _surnamecontroller = TextEditingController();
  final _firstnamecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _psswrdcontroller = TextEditingController();
  String? _emailerrorText = "This field is Required";
  String? _surerrorText;
  String? _firstnameerrorText;
  String? _lastnameerrotText;
  String? _psswrderrorText;
  String? _mailerrorText = "Invalid mail";
  bool _uppercase = false;
  bool _lowercase = false;
  bool _spcharacter = false;
  bool _numb = false;
  bool _length = false;
  bool _passVisibility = true;

  void _visibility(){
    setState(() {
      _passVisibility= !_passVisibility;
    });
  }

  void _validInput() {
    setState(() {
      _surerrorText =_surnamecontroller.text.isEmpty ? "This field is required" : null;
      _firstnameerrorText =_firstnamecontroller.text.isEmpty ? "This field is required" : null;
      _lastnameerrotText =_lastnamecontroller.text.isEmpty ? "This field is required" : null;
      _emailerrorText =_emailcontroller.text.isEmpty ? "This field is requirered" : null;
    });
    if (_surnamecontroller.text.isEmpty || _firstnamecontroller.text.isEmpty ||
        _lastnamecontroller.text.isEmpty) {
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

  void _validatepsswrd(String psswrd) {
    setState(() {
      _psswrderrorText =
      _psswrdcontroller.text.isEmpty ? "Enter your Password" : null;
      _uppercase = psswrd.contains(RegExp(r'[A-Z]'));
      _lowercase = psswrd.contains(RegExp(r'[a-z]'));
      _spcharacter = psswrd.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'));
      _numb = psswrd.contains(RegExp(r'[1234567890]'));
      _length = psswrd.length >= 8;
    });
    if (_psswrdcontroller.text == null || _psswrdcontroller.text.isEmpty) {
      _psswrderrorText;
    }
  }

  Widget _psswrdRequirement(bool psswrd, String text) {
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
      backgroundColor: Colors.purple[100],
      body: ListView(
        children:[Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             padding: EdgeInsets.only(left: 25,bottom: 15,top: 75),
              //color: Colors.orange,
              child: IconButton(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },icon: Image.asset('assets/images/back_Arr.png', width: 53,)),
            ),
            Container(
              //color: Colors.red,
              padding: const EdgeInsets.all(8),
              child: Form(
                  key: _signkey,
                  autovalidateMode:AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
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
                      const SizedBox(height: 15,),
                      TextFormField(
                        controller: _surnamecontroller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                        ),
                        validator: (v){
                          if(v!.isEmpty){
                            return "This field is required";
                          }else{
                            return null;
                          }
                        }
                      ),
                      const SizedBox(height: 9,),
                      TextFormField(
                        controller: _firstnamecontroller,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Surname',
                        ),
                        validator: (v){
                          if(v!.isEmpty){
                         return " This field is requierd";
                          }else{
                            return null;
                          }
                        },
                      ),
                     const SizedBox(height: 9,),
                      TextFormField(
                        controller: _lastnamecontroller,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Last Name',
                        ),
                          validator: (v){
                            if(v!.isEmpty){
                              return "This field is required";
                            }else{
                              return null;
                            }
                          }
                      ),
                      const SizedBox(height: 9,),
                      TextFormField(
                        controller: _emailcontroller,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Mail',
                        ),
                          validator:(v){
                          if(v!.isEmpty){
                            return "This field is Required";
                          }else{
                            return null;
                          }
                          }
                      ),
                      const SizedBox(height: 9,),
                      TextFormField(
                        controller: _psswrdcontroller,
                        obscureText: _passVisibility,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: (){
                            _visibility();
                          }, icon: Image.asset('assets/images/paseye1.png', width: 19,)),
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          errorText: _psswrderrorText,
                        ),
                        onChanged: _validatepsswrd,
                          validator: (v){
                            if(v!.isEmpty){
                              return "This field is required";
                            }else{
                              return null;
                            }
                          }
                      ),
                      const SizedBox(height: 5,),
                      _psswrdRequirement(_length, "Password must be at least 8 characters"),
                      _psswrdRequirement(_uppercase, "At least 1Uppercase"),
                      _psswrdRequirement(_lowercase, "At least 1 lowercase"),
                      _psswrdRequirement(_spcharacter, "Add some special characters"),
                      _psswrdRequirement(_numb, "At least one Number"),
                      const SizedBox(height: 25),

                      Container(
                        width: 365,
                        height: 56,
                        margin: const EdgeInsets.only(left: 2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: ElevatedButton(onPressed: (){
                         if(_signkey.currentState!.validate()){
                           validateEmail();
                           _validInput();
                           while(true){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyApp()));
                           }
                         }else{
                         }
                          },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomRight:Radius.circular(35))
                              )
                            ),
                            child: Text('Sign Up',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.purple[100],
                              ),),
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),
          ],
        ),
      ]
      ),
    );
  }
}

