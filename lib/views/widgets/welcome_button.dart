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
    return MaterialButton(
      color: const Color.fromRGBO(75, 78, 113, 20.0),
      onPressed: onTap,
      hoverColor: const Color.fromRGBO(174, 122, 96, 20.0),

      shape: const StadiumBorder(),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: textColor ?? lightColorScheme.primary,
        ),
      ),
    );
  }
}
