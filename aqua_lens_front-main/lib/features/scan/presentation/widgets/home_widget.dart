import 'package:aqua_lens/features/scan/domain/detection_result.dart';
import 'package:aqua_lens/features/scan/presentation/screens/detection_card.dart';
import 'package:aqua_lens/features/scan/presentation/widgets/boost_banner.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          const StatsWidget(),
          const SizedBox(
            height: 24,
          ),
          const BoostBanner(),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "   My Detections",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return DetectionCard(
                    result: DetectionResult(
                        itemCount: 10 - index,
                        averageAccuracy: 77 + index,
                        minAccuracy: 50 - index * 2,
                        maxAccuracy: 60 + index * 2,
                        imagePath: "assets/micro1.jpeg"));
              },
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "500",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              "Microplastics\nDetected",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        SizedBox(
          height: 124,
          child: VerticalDivider(
            thickness: 2,
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          children: [
            Text(
              "43",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Images",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "60.3%",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Avg Accuracy",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
