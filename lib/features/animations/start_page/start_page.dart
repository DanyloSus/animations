import 'package:animations/features/animations/start_page/components/start_button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: StartButton(),
      ),
    );
  }
}
