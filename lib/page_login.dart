import 'package:flutter/material.dart';
import 'package:imake/components/build_text_field.dart';
import 'package:imake/routes/pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  _login(context) {
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');

    return true;
  }

  _passwordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
    print('Password visibility');
  }

  startTimer() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Pages.home,
        (route) => false,
      );
    });
  }

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
          BuildTextField(
            hint: 'E-mail',
            controller: _usernameController,
            inputType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email),
            onChange: (context) {
              print('Username: ${_usernameController.text}');
            },
          ),
          const SizedBox(height: 10),
          BuildTextField(
            hint: 'Password',
            controller: _passwordController,
            inputType: TextInputType.text,
            prefixIcon: Icon(Icons.password),
            obscureText: _hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                _passwordVisibility();
                print('Password: ${_passwordController.text}');
              },
              icon: _hidePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            ),
            onChange: (context) {
              print('Username: ${_usernameController.text}');
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              bool _validate = _login(context);
              if (!_validate) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Credenciais inválidas!'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.red[300],
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Acesso validado com sucesso!'),
                  duration: Duration(seconds: 2),
                ));

                startTimer();
              }
            },
            child: Text('Validar acesso'),
          ),
        ],
      ),
    )));
  }
}
