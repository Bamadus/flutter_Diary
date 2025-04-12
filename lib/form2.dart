import 'package:flutter/material.dart';

void main(){
  runApp(const myform());

}

class myform extends StatelessWidget{
  const myform({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Form'),),
        body: const formContent(),
      ),
    );
  }
}

class formContent extends StatefulWidget{
  const formContent({super.key});
  @override
  State<StatefulWidget> createState() {
    return _formContentState();
  }
}

class _formContentState extends State<formContent>{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your name'),
            validator: (String? name){
              if(name ==null || name.isEmpty){
                return'please enter a name';
              }
              return null;
          }
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()){

              }
            }, child: const Text('Submit!!')),
          )
        ],
      ),
    );
  }
}