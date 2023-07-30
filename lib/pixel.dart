import 'package:flutter/material.dart';
class pixel extends StatelessWidget {
  var colour;
  var child;
  pixel({required this.colour, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(color: colour,borderRadius: BorderRadius.circular(6)),
        child: Center(child: Text(child,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
