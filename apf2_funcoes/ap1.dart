import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Retângulos Coloridos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  )
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.purple,
                      margin: EdgeInsets.all(8),
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.cyan,
                      margin: EdgeInsets.all(8),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.purple,
                          margin: EdgeInsets.all(8),
                        ),Container(
                          width: 50,
                          height: 50,
                          color: Colors.cyan,
                          margin: EdgeInsets.all(8),
                        ),
                      ],
                    )
                  ],
                ),
                color: Colors.yellow,
                margin: EdgeInsets.all(8),
              ),
              Stack(
                children: [

                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                    margin: EdgeInsets.all(8),
                  )
                ],
              )
            ],
          ),
          ),
        ),
      );
  }
}
