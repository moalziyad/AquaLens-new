import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UpgradeBanner extends StatelessWidget {
  const UpgradeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      // padding: const EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/map.png', // Replace with your map image path
              fit: BoxFit.cover,
            ).animate().blurXY(end: 5).fadeIn(duration: 800.ms),
          ),
          const Text(
            "Get Informed:\n See Microplastic Concentrations Around You",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 300.ms),
        ],
      ),
    ).animate().slideY(begin: 0.5).fadeIn(duration: 800.ms);
  }
}
