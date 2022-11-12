import 'package:flutter/material.dart';

class GuessesList extends StatelessWidget {
  const GuessesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: ListView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            color: Colors.amber,
            height: 50,
          );
        },
      ),
    );
  }
}
