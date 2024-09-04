import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(1, 114, 178, 1),
                    Color.fromRGBO(0, 22, 69, 1)
                  ])),
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset("assets/logo.png"),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "A Clean World, One Image At A Time",
                      style: TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: FilledButton(
                        style: const ButtonStyle(
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.black),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(217, 217, 217, 1))),
                        onPressed: () {
                          Navigator.pushNamed(context, 'edu');
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
