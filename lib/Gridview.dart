import 'package:flutter/material.dart';

class Gridview extends StatelessWidget{
  const Gridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.amberAccent
          ),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return GridView.count(
                crossAxisSpacing: 5,
                  padding: const EdgeInsets.all(15),
                  crossAxisCount:
                  orientation == Orientation.portrait ? 2 : 3,
                  mainAxisSpacing: orientation == Orientation.landscape ? 6 : 5,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(7),
                      color: Colors.amberAccent[400],
                      child: TextButton(onPressed: () {
                        var snackBar = SnackBar(
                          backgroundColor: Colors.black54,
                          content: const Text(
                            "This current page is an example!!", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white
                          ),),
                          action: SnackBarAction(label: 'Got it', onPressed: () {}),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                          child: const Text('Grid view!!',
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      color: Colors.orange[600],
                      child: TextButton(onPressed: () {
                        var snackBar = SnackBar(
                          backgroundColor: Colors.black54,
                          content: const Text(
                            "This is a snack Bar!!", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white
                          ),),
                          action: SnackBarAction(label: 'Okay!!', onPressed: () {}),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }, child: const Text('Snack Bar!!', style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      color: Colors.amberAccent[400],
                      child: TextButton(onPressed: () {

                      },
                          child: const Text('Images...',
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)),
                    ),
                  ]
              );
            }),
        )
    );
          }



  }
