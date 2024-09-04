import 'package:aqua_lens/features/scan/presentation/screens/camera_widget.dart';
import 'package:aqua_lens/features/scan/presentation/screens/community_screen.dart';
import 'package:aqua_lens/features/scan/presentation/widgets/home_widget.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    const HomeWidget(),
    const CameraPage(),
    const CommunityScreen()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: selectedIndex == 0
            ? AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                titleSpacing: 24,
                toolbarHeight: 75,
                actions: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
                title: const Text(
                  "Hi Mohammed 👋",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              )
            : null,
        bottomNavigationBar: CrystalNavigationBar(
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: (p0) {
            setState(() {
              selectedIndex = p0;
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: Colors.black,
            ),
            CrystalNavigationBarItem(
              icon: Icons.filter_center_focus_outlined,
              unselectedIcon: Icons.filter_center_focus,
              selectedColor: Colors.black,
            ),
            CrystalNavigationBarItem(
              icon: Icons.group,
              unselectedIcon: Icons.group_outlined,
              selectedColor: Colors.black,
            ),
          ],
          currentIndex: selectedIndex,
          indicatorColor: const Color.fromARGB(255, 91, 70, 70),
        ),
        body: screens[selectedIndex]);
  }
}
