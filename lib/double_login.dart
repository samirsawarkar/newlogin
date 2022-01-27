import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future createAlbum(String name, String password) async {
  final response = await http.post(
    Uri.parse('http://samirsuper.pythonanywhere.com/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      "password": password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return (jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}



class LoginHome extends StatefulWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool sut = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _name,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: _password,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var name = _name.text;
                  var password = _password.text;
                  setState(() {
                    print("$name $password");
                  });
                  var nameLo = await createAlbum(name, password);
                  if (nameLo.containsKey('name')) {
                    bool sut = true;
                    print('om');
                  } else {
                    print("login failed");
                  }
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => HomePages(),
                        )));
                  },
                  child: Text('om'))
            ],
          ))),
    );
  }
}

// 



class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}