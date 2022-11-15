import 'package:flutter/material.dart';

class EmptyLists extends StatelessWidget {
  const EmptyLists({
    super.key,
    required this.margin,
    required this.message,
  });

  final double margin;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
