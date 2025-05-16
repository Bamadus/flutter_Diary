import 'package:flutter/material.dart';

void main(){
  runApp(const tabcontr());
}

class tabcontr extends StatelessWidget{
  const tabcontr({super.key});

  static const List<Tab> tabs = <Tab>[Tab(text: 'Zeroth'),
  Tab(text: 'first'), Tab(text: 'second')];

  @override
  Widget build(BuildContext context) {
    const title= "Tabs App";
    return const MaterialApp(
      home: tabcont(tabs: tabs),
    );
  }
}
class tabcont extends StatelessWidget{
  const tabcont({super.key, required this.tabs});

  final List<Tab> tabs;

}