import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final String name;
  final Widget image;

  const CharacterWidget({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: image,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
