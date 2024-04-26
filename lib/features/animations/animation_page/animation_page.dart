import 'package:animations/features/animations/animation_page/components/anim_button.dart';
import 'package:animations/features/animations/animation_page/components/diagram.dart';
import 'package:animations/features/animations/animation_page/components/gif.dart';
import 'package:animations/features/animations/animation_page/components/video.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    final int argument = ModalRoute.of(context)!.settings.arguments as int;

    const List<Widget> sections = [
      DiagramSection(),
      GifSection(),
      AnimButtonSection(),
      VideoSection()
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          sections[argument],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              argument != 0
                  ? IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/animations',
                          arguments: argument - 1,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left,
                      ),
                    )
                  : const SizedBox(),
              argument != sections.length - 1
                  ? IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/animations',
                          arguments: argument + 1,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right,
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
