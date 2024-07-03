import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
              text: TextSpan(
            text: 'IMake ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 76, 126)),
            children: <TextSpan>[
              TextSpan(text: 'Tasks', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
            ],
          )),
          Text('Faça o login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-mail',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: null,
            child: Text('Login'),
          ),
        ],
      ),
    )));
  }
}
