import 'package:flutter/material.dart';
import 'package:itcooking/Simple Project/signUp.dart';


void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '...',
      home: LoginPage(),

    );
  }
}

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final textController =TextEditingController(text: 'you');
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  String? _namerrorText;
  String? _ageerrorText;
  String? _passwordText;

  void _validateInput() {
    setState((){
      _namerrorText= _namecontroller.text.isEmpty?"Enter a name Pls!!":null;
      _passwordText= _passwordcontroller.text.isEmpty ? "This field is required." : null;
      _ageerrorText= int.tryParse(_agecontroller.text) == null ? "Enter Numbers Only": null;

      if (_namecontroller.text.isEmpty || _agecontroller.text.isEmpty || _passwordcontroller.text.isEmpty) {
        _namerrorText;
        _ageerrorText;
        _passwordText;

      }else if (_namecontroller.text.length < 2) {
        _namerrorText = 'Must be at least 3 characters';

      }else if(_agecontroller.text.length != 7){
        _ageerrorText = 'Reg No must be 7 digits';
      }
      else {
        _namerrorText = null; // No error
      }
    });
  }
  //String? err = 'Please enter your name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(title: Text('BAMADUS',
        style: TextStyle(
          color: Colors.purple[400],
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),),
        actions:[
          TextButton.icon(onPressed: (){},
              icon: const Icon(Icons.accessibility_new_rounded),
              label:const Text("Help Me?"))
        ],
        backgroundColor: Colors.purple[100],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children:[
                //Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                const SizedBox(height: 55,),
               Expanded(
                   child:ListView(
                     children: [Column(
                         mainAxisAlignment:MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children:[
                           Center(
                             child:Opacity(opacity: 0.7,
                                 child:
                                 Image.asset('assets/images/login_image2.png',
                                   width: 185,
                                   color: Colors.blueGrey[600],
                                 )),
                           ),
                           const SizedBox(height: 21,),
                           Text('Name',
                             style: TextStyle(
                               color: Colors.purple[600],
                             ),
                           ),
                           TextField(
                             controller: _namecontroller,
                             decoration: InputDecoration(
                               prefixIcon: IconButton(onPressed:(){},
                                   icon:const Icon(Icons.account_circle)),
                               border: const OutlineInputBorder(),
                               //labelText: "Name",
                               hintText: "Enter your Name",
                               errorText: _namerrorText,
                             ),
                           ),
                           const SizedBox(height: 11),
                           Text("Reg Number",
                             style: TextStyle(
                               color: Colors.purple[600],
                             ),
                           ),
                           TextField(
                             controller: _agecontroller,
                             decoration: InputDecoration(
                               prefixIcon: IconButton(onPressed: (){
                                 // nothing when the button is pressed yet
                               }, icon: const Icon(Icons.add_circle)
                               ),
                               border: const OutlineInputBorder(),
                               hintText: "Reg No",
                               errorText: _ageerrorText,
                             ),
                           ),
                           const SizedBox(height: 15),
                           Text("Password",
                             style: TextStyle(
                               color: Colors.purple[600],
                             ),
                           ),
                           TextField(
                             controller: _passwordcontroller,
                             obscureText:true ,
                             decoration: InputDecoration(
                                 prefixIcon: const Icon(Icons.account_balance_wallet_rounded),
                                 border: const OutlineInputBorder(),
                                 labelText: 'Password',
                                 errorText: _passwordText
                             ),
                           ),
                           Row(
                             children: [
                               TextButton(onPressed:(){}, child:const Text("Forgot Password?") ),
                               const Spacer(),
                               TextButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const sign()));
                               }, child: const Text('Sign Up'))
                             ],
                           ),
                           const SizedBox(height: 55),
                           Container(
                             width: 182,
                             height: 45,
                             margin: const EdgeInsets.only(left: 65),
                             child: Padding(
                               padding: const EdgeInsets.symmetric(),
                               child: ElevatedButton(onPressed: (){
                                 _validateInput();
                                 },
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: Colors.purple[200],
                                 ),
                                 child: const Text('Login',
                                   style: TextStyle(
                                     fontSize: 25,
                                     fontWeight: FontWeight.bold,
                                     fontStyle: FontStyle.italic,
                                   ),),
                               ),
                             ),
                           )
                         ]
                     ),
                     ],
                   ),
                  ),
                //const SizedBox(height:15),

              ],
            )
            ),
          ),
      ),
      );
  }
}

