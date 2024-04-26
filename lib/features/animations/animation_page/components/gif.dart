import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class GifSection extends StatefulWidget {
  const GifSection({super.key});

  @override
  State<GifSection> createState() => _GifSectionState();
}

class _GifSectionState extends State<GifSection> with TickerProviderStateMixin {
  late final GifController controller;
  int _fps = 30;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gif(
          controller: controller,
          fps: _fps,
          autostart: Autostart.once,
          image: const NetworkImage(
              'https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp'),
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Slider(
              label: 'Timeline',
              value: controller.value,
              onChanged: (v) => setState(() {
                controller.value = v;
              }),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                controller.repeat();
              },
            ),
            IconButton(
              icon: const Icon(Icons.stop),
              onPressed: () {
                controller.stop();
              },
            ),
          ],
        ),
        Slider(
          label: _fps.toString(),
          value: _fps.toDouble(),
          min: 1,
          max: 60,
          divisions: 4,
          onChanged: (v) => setState(() {
            controller.stop();
            _fps = v.round();
          }),
        ),
      ],
    );
  }
}
