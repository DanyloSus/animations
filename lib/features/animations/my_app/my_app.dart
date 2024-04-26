import 'package:animations/features/animations/animation_page/animation_page.dart';
import 'package:animations/features/animations/start_page/start_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StartPage(),
      initialRoute: "/",
      routes: {
        '/animations': (_) => const AnimationPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/animations') {
          return MaterialPageRoute(
            builder: (context) {
              return const Text('');
            },
          );
        }

        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
