import 'package:flutter/material.dart';
import 'package:flutter_cat_app/views/breeds_screen.dart';

//30ad0562-66c2-4263-9963-01efc36335ef

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BreedsScreen(),
    );
  }
}
