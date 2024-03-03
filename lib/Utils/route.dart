

   import 'package:flutter/material.dart';

Route createRoute(Widget page) {
                return PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 1500),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      page,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(1, 0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                );
              }