import 'package:aqua_lens/features/scan/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HowScreen extends StatelessWidget {
  const HowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "How to use AquaLens?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 300.ms),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).animate().scale(delay: (300 * index).ms),
                      const SizedBox(height: 16),
                      Text(
                        texts[index][0],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: (300 * index).ms),
                      const SizedBox(height: 8),
                      Text(
                        texts[index][1],
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: (300 * index).ms),
                      const SizedBox(height: 32),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }),
                );
              },
              child: const Text(
                "Next",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ).animate().fadeIn().scale(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

final texts = [
  [
    'Prepare Your Environment',
    "Make sure you have enough light, and you are close enough to the object",
  ],
  [
    "Take A Picture",
    "Ensure that the microplastics are as visible as possible in your image",
  ],
  [
    "Let Us Do The Work",
    'Our model will detect and quantify all the microplastics',
  ]
];
