import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BoostBanner extends StatelessWidget {
  const BoostBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor.withOpacity(0.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.enhance_photo_translate,
            color: Colors.white,
            size: 30,
          ).animate().fadeIn().scale(delay: 200.ms),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Boost Your Output Accuracy With Our Special Lens",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(delay: 400.ms),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 30,
          ).animate().fadeIn().moveX(begin: 20, delay: 600.ms),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.5);
  }
}