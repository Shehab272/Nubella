import 'package:flutter/material.dart';
import 'package:nubella/views/welcome_screen.dart';
/// Flutter code sample for [LinearGradient].


// class MoodyGradient extends StatelessWidget {
//   const MoodyGradient(
//   {
//   this.text,
//   required this.gradient,
//   this.style,
// }
// );
//   final text;
//   final gradient;
//   final style;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment(0.8, 1),
//             colors: <Color>[
//               Color(0xff1f005c),
//               Color(0xff5b0060),
//               Color(0xff870160),
//               Color(0xffac255e),
//               Color(0xffca485c),
//               Color(0xffe16b5c),
//               Color(0xfff39060),
//               Color(0xffffb56b),
//             ], // Gradient from https://learnui.design/tools/gradient-generator.html
//             tileMode: TileMode.mirror,
//           ),
//         ),
//       ),
//     );
//   }
// }




class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}