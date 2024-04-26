import 'package:flutter/material.dart';

class AnimButtonSection extends StatefulWidget {
  const AnimButtonSection({super.key});

  @override
  State<AnimButtonSection> createState() => _AnimButtonSectionState();
}

class _AnimButtonSectionState extends State<AnimButtonSection> {
  bool buttonState = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          setState(() {
            buttonState = !buttonState;
          });
        },
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            buttonState ? Icons.star : Icons.star_border,
            key: ValueKey(buttonState),
          ),
          transitionBuilder: (child, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(animation),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1).animate(animation),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
