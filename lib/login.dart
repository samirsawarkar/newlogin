import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newlogin/home.dart';

Future login(String name, String password) async {
  final response = await http.post(
    Uri.parse("http://samirsuper.pythonanywhere.com/login"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({"name": name, "password": password}),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(hintText: "Enter your name "),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(hintText: "Enter your name "),
            ),
            ElevatedButton(
              onPressed: () async {
                var name = _name.text;
                var password = _password.text;
                print("login failed");

                var nameLo = await login(name, password);
                print(nameLo.containsKey('name'));
                homePage;
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                        builder: (context) => homePage(),
                      )));
                },
                child: Text('om'))
          ],
        ),
      ),
    );
  }
}
