import 'package:flutter/material.dart';
import 'package:project/constants.dart';

class Responsive extends StatefulWidget {
  final Widget mobilescreen;
  final Widget webscreen;
  const Responsive({super.key, required this.mobilescreen, required this.webscreen});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints)
      {
        if(constraints.maxWidth<900)
         {
          isMobile=true;
          isWeb=false;
          return widget.mobilescreen;
         }
        else 
          {
            isWeb=true;
            isMobile=false;
            return widget.webscreen;
          }
      }
    );
  }
}