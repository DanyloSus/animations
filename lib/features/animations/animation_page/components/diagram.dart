import 'dart:math';

import 'package:flutter/material.dart';

class DiagramSection extends StatefulWidget {
  const DiagramSection({super.key});

  @override
  State<DiagramSection> createState() => _DiagramSectionState();
}

class _DiagramSectionState extends State<DiagramSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [0, 50, 25, 100];

    return AnimatedBuilder(
      animation: _animationController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: numbers
              .map(
                (number) => SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: (number / numbers.reduce(max)).toDouble() * 250,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(number.toString()),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
      builder: (_, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeIn,
          ),
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeIn,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
