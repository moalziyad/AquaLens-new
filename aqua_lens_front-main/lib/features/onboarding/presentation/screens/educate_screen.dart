import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildPage(
                    image: Icons.scatter_plot,
                    title: 'What are Microplastics?',
                    description:
                        'Microplastics are tiny plastic particles less than 5mm in size. They are found in water, air, and even the food we eat.',
                  ),
                  _buildPage(
                    image: Icons.warning_amber_rounded,
                    title: 'Why Should We Care?',
                    description:
                        'Microplastics can harm marine life, enter the food chain, and impact human health. They are a growing environmental concern.',
                  ),
                  _buildPage(
                    image: Icons.eco,
                    title: 'What Can We Do?',
                    description:
                        'Reduce plastic use, recycle, and support initiatives to clean up plastic waste. Every small action helps in tackling this issue.',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentPage == index ? 12.0 : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animate().fadeIn(
                    duration: 300.ms,
                    delay: 100.ms * index); // Fade-in animation for indicators
              }),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.of(context).pushNamed('how');
                }
              },
              child: Text(_currentPage < 2 ? 'Next' : 'Get Started'),
            ).animate().fadeIn().scale(), // Button animation
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required IconData image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          image,
          size: 100,
          color: Colors.blueAccent,
        ).animate().scale(delay: 100.ms).fadeIn(), // Icon animation
        const SizedBox(height: 24.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ).animate().slideX(duration: 300.ms), // Title animation
        const SizedBox(height: 16.0),
        Text(
          description,
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        )
            .animate()
            .fadeIn(delay: 200.ms)
            .slideY(duration: 300.ms), // Description animation
      ],
    );
  }
}
