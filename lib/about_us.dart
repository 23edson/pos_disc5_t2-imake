import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desenvolvedores'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              'assets/svgs/logo-unoesc.svg',
              width: 300,
            ),
            Text('Desenvolvedores', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('Projeto por:'),
            Text('Prof. Roberson Junior Fernandes Alves'),
            SizedBox(
              height: 20,
            ),
            Text('Alterações por:'),
            Text('Edson Lemes da Silva')
          ],
        ),
      ),
    );
  }
}
