// import 'package:flutter/material.dart';

// void main() => runApp(const LogoApp());

// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: const Duration(seconds: 2), vsync: this);
//     animation = Tween<double>(begin: 0, end: 300).animate(controller)
//       ..addListener(() {
//         setState(() {
//           // The state that has changed here is the animation object's value.
//         });
//       });
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         height: 300,
//         width: 300,
//         child: const FlutterLogo(),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }