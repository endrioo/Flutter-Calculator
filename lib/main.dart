import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget__tes/page/home_page.dart';
import 'theme/text_theme.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: myTextTheme),
        home: const HomePage(),
    );
  }
}


