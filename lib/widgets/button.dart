import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Color color;
  final String buttonText;
  final Function buttonOnPressed;

  Button({this.color, this.buttonText, @required this.buttonOnPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            buttonOnPressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
