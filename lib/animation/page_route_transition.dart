import 'package:flutter/material.dart';

Route createRoute(Widget Screen) {
  return PageRouteBuilder(
    transitionDuration: const Duration(
      milliseconds: 300,
    ),
    pageBuilder: (context, animation, secondaryAnimation) => Screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInToLinear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
