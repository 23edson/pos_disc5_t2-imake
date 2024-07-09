import 'package:flutter/material.dart';
import 'package:imake/components/build_text_field.dart';
import 'package:imake/components/loading.dart';
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
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    }

    //user: admin, senha: admin
    if (_usernameController.text != 'admin' || _passwordController.text != 'admin') {
      return false;
    }

    return true;
  }

  _passwordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
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
              text: const TextSpan(
            text: 'T2 - Pós',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 76, 126)),
            children: <TextSpan>[
              TextSpan(text: '-app', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
            ],
          )),
          const Text('Faça o login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          BuildTextField(
            hint: 'E-mail',
            controller: _usernameController,
            inputType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
            onChange: (context) {},
          ),
          const SizedBox(height: 10),
          BuildTextField(
            hint: 'Password',
            controller: _passwordController,
            inputType: TextInputType.text,
            prefixIcon: const Icon(Icons.password),
            obscureText: _hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                _passwordVisibility();
              },
              icon: _hidePassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
            ),
            onChange: (context) {},
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              bool validate = _login(context);

              if (!validate) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Credenciais inválidas!'),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red[300],
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Acesso validado com sucesso!'),
                  duration: Duration(seconds: 2),
                ));
                Loading().show(context);
                startTimer();
              }
            },
            child: const Text('Validar acesso'),
          ),
        ],
      ),
    )));
  }
}
