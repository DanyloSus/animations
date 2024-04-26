import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/animations', arguments: 0);
      },
      child: const Text("Start"),
    );
  }
}
