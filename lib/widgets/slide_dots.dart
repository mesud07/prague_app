import 'package:flutter/material.dart';
class SlideDots extends StatelessWidget {
final isActive;

  SlideDots({Key? key, this.isActive}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 150),
    height: isActive ? 12 : 8,
      width: isActive ? 12: 8,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
