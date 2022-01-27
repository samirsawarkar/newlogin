import 'package:flutter/material.dart';
import 'package:newlogin/login.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('home to '),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
