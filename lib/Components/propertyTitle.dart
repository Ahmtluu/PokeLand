import 'package:flutter/material.dart';

class ProperTitle extends StatelessWidget {

  ProperTitle({@required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 20,

      ),);
  }
}