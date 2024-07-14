import 'package:flutter/material.dart';

class Loading {
  late BuildContext context;

  Future<void> show(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.grey,
            child: const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 48, 60, 221),
              ),
            ),
          );
        }
    );
  }

  Future<void> hide(BuildContext context) async {
    Navigator.of(context).pop();
  }
}
