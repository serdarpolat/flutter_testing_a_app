import 'package:flutter/material.dart';
import 'package:myapp/pages/kontrolpaneli.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: IlcelerJSON(),
      /*routes: <String, WidgetBuilder>{
      HOME_SCREEN: (BuildContext context) => new IlcelerJSON(),
    },*/
    );
  }
}
