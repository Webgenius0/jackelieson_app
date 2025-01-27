// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';

// class CustomButtonDesign extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;

//   const CustomButtonDesign({
//     super.key,
//     required this.label,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final WIDTH = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       onTap: onPressed,
//       child:

// //Add this CustomPaint widget to the Widget Tree
//           CustomPaint(
//         size: Size(
//             WIDTH,
//             (WIDTH * 0.16119402985074627)
//                 .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//         painter: RPSCustomPainter(),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: Center(
//         child: CustomButtonDesign(
//           label: 'Click Me',
//           onPressed: () {
//             print('Button Pressed');
//           },
//         ),
//       ),
//     ),
//   ));
// }

// //Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0Fill = Paint()..style = PaintingStyle.fill;
//     paint0Fill.shader = ui.Gradient.radial(
//         Offset(0, 0),
//         size.width * 0.002985075,
//         [Color(0xffF75B80), Color(0xffF9065A), Color(0xffEF2A32)],
//         [0, 0.321012, 1]);
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//             Rect.fromLTWH(size.width * 0.01194030, size.height * 0.05555556,
//                 size.width * 0.9373134, size.height * 0.8518519),
//             bottomRight: Radius.circular(size.width * 0.03582090),
//             bottomLeft: Radius.circular(size.width * 0.03582090),
//             topLeft: Radius.circular(size.width * 0.03582090),
//             topRight: Radius.circular(size.width * 0.03582090)),
//         paint0Fill);

//     Paint paint1Stroke = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.005970149;
//     paint1Stroke.shader = ui.Gradient.linear(
//         Offset(size.width * 0.6205104, size.height * 1.069076),
//         Offset(size.width * 0.09111761, size.height * 2.040278),
//         [Color(0xffFA5A94).withOpacity(1), Color(0xffFF84B8).withOpacity(1)],
//         [0, 1]);
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//             Rect.fromLTWH(size.width * 0.01492537, size.height * 0.07407407,
//                 size.width * 0.9313433, size.height * 0.8148148),
//             bottomRight: Radius.circular(size.width * 0.03283582),
//             bottomLeft: Radius.circular(size.width * 0.03283582),
//             topLeft: Radius.circular(size.width * 0.03283582),
//             topRight: Radius.circular(size.width * 0.03283582)),
//         paint1Stroke);

//     Paint paint1Fill = Paint()..style = PaintingStyle.fill;
//     paint1Fill.color = Color(0xff000000).withOpacity(1.0);
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//             Rect.fromLTWH(size.width * 0.01492537, size.height * 0.07407407,
//                 size.width * 0.9313433, size.height * 0.8148148),
//             bottomRight: Radius.circular(size.width * 0.03283582),
//             bottomLeft: Radius.circular(size.width * 0.03283582),
//             topLeft: Radius.circular(size.width * 0.03283582),
//             topRight: Radius.circular(size.width * 0.03283582)),
//         paint1Fill);

//     Path path_2 = Path();
//     path_2.moveTo(size.width * 0.9420478, size.height * 0.7206426);
//     path_2.lineTo(size.width * 0.9462687, size.height * 0.7468056);
//     path_2.lineTo(size.width * 0.9504896, size.height * 0.7206426);
//     path_2.lineTo(size.width * 0.9849612, size.height * 0.5069185);
//     path_2.cubicTo(
//         size.width * 0.9860507,
//         size.height * 0.5007148,
//         size.width * 0.9872149,
//         size.height * 0.4928204,
//         size.width * 0.9881194,
//         size.height * 0.4862944);
//     path_2.cubicTo(
//         size.width * 0.9889582,
//         size.height * 0.4802333,
//         size.width * 0.9900030,
//         size.height * 0.4722907,
//         size.width * 0.9905343,
//         size.height * 0.4668167);
//     path_2.lineTo(size.width * 0.9905373, size.height * 0.4667722);
//     path_2.cubicTo(
//         size.width * 0.9927313,
//         size.height * 0.4440574,
//         size.width * 0.9940299,
//         size.height * 0.4176241,
//         size.width * 0.9940299,
//         size.height * 0.3892593);
//     path_2.cubicTo(
//         size.width * 0.9940299,
//         size.height * 0.2994167,
//         size.width * 0.9814776,
//         size.height * 0.2314815,
//         size.width * 0.9670000,
//         size.height * 0.2314815);
//     path_2.cubicTo(
//         size.width * 0.9588090,
//         size.height * 0.2314815,
//         size.width * 0.9512836,
//         size.height * 0.2530815,
//         size.width * 0.9462687,
//         size.height * 0.2880889);
//     path_2.cubicTo(
//         size.width * 0.9412537,
//         size.height * 0.2530815,
//         size.width * 0.9337284,
//         size.height * 0.2314815,
//         size.width * 0.9255373,
//         size.height * 0.2314815);
//     path_2.cubicTo(
//         size.width * 0.9110597,
//         size.height * 0.2314815,
//         size.width * 0.8985075,
//         size.height * 0.2994167,
//         size.width * 0.8985075,
//         size.height * 0.3892593);
//     path_2.cubicTo(
//         size.width * 0.8985075,
//         size.height * 0.4175537,
//         size.width * 0.8997910,
//         size.height * 0.4440167,
//         size.width * 0.9020060,
//         size.height * 0.4668333);
//     path_2.cubicTo(
//         size.width * 0.9025045,
//         size.height * 0.4719944,
//         size.width * 0.9034507,
//         size.height * 0.4794870,
//         size.width * 0.9043254,
//         size.height * 0.4858815);
//     path_2.cubicTo(
//         size.width * 0.9052209,
//         size.height * 0.4924389,
//         size.width * 0.9064030,
//         size.height * 0.5004852,
//         size.width * 0.9076119,
//         size.height * 0.5071500);
//     path_2.lineTo(size.width * 0.9420478, size.height * 0.7206426);
//     path_2.close();

//     Paint paint2Stroke = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.01194030;
//     paint2Stroke.color = Color(0xff202020).withOpacity(1.0);
//     canvas.drawPath(path_2, paint2Stroke);

//     Paint paint2Fill = Paint()..style = PaintingStyle.fill;
//     paint2Fill.color = Colors.white.withOpacity(1.0);
//     canvas.drawPath(path_2, paint2Fill);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
