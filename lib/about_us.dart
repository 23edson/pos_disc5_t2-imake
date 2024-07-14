import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsScreen extends StatelessWidget {

    const AboutUsScreen({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
            title: const Text('Sobre'),
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                SvgPicture.asset(
                'assets/svgs/logo-unoesc.svg',
                width: 300,
                ),
                const Text('Desenvolvedores', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                height: 10,
                ),
                const Text('Projeto por:'),
                const Text('Prof. Roberson Junior Fernandes Alves'),
                const SizedBox(
                height: 20,
                ),
                const Text('Alterações por:'),
                const Text('Edson Lemes da Silva')
            ],
            ),
        ),
    );
  }
}
