import 'package:flutter/material.dart';
import 'package:nubella/theme/theme.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      this.color,
      this.textColor});
  final String buttonText;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttonText,
          // textAlign: TextAlign.center,
          style:  TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor?? lightColorScheme.primary,
          ),
        ),
      ),
    );
  }
}
