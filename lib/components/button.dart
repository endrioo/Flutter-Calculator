import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final void Function() ontap;
  IconData? icon;
 
  CalculatorButton({Key? key, 
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.ontap,
  }) : super(key: key);
 
  // ignore: non_constant_identifier_names
  CalculatorButton.Icon({Key? key, 
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.text,
    required this.ontap,
  }) : super(key: key);
 
  @override
  Widget build (BuildContext context ) {
    return GestureDetector(
      onTap: ontap,
      
      child:Container(
        color: backgroundColor,
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: foregroundColor),
                )
              : Icon(
                  icon,
                  color: foregroundColor,
                ),
        ),
      ),
    ); 
  }
}