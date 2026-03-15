import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/group.png',
      'title': 'Welcome To Islami App',
      'desc': '',
    },
    {
      'image': 'assets/images/image_mosqu.png',
      'title': 'Welcome To Islami',
      'desc': 'We Are Very Excited To Have You In Our Community',
    },
    {
      'image': 'assets/images/mosqu.png',
      'title': 'Reading the Quran',
      'desc': 'Read, and your Lord is the Most Generous',
    },
    {
      'image': 'assets/images/doaa.png',
      'title': 'Bearish',
      'desc': 'Praise the name of your Lord, the Most High',
    },
    {
      'image': 'assets/images/mecrophone.png',
      'title': 'Holy Quran Radio',
      'desc': 'You can listen to the Holy Quran Radio through the application for free and easily',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/images/ic_splash.png', height: 100),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(_pages[index]['image']!, height: 300),
                        const SizedBox(height: 20),
                        Text(
                          _pages[index]['title']!,
                          style: const TextStyle(
                            color: Color(0xFFE2BE7F),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _pages[index]['desc']!,
                          style: const TextStyle(
                            color: Color(0xFFE2BE7F),
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _currentPage == 0
                        ? null
                        : () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                    child: Text(
                      _currentPage == 0 ? '' : 'Back',
                      style: const TextStyle(color: Color(0xFFE2BE7F)),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(4),
                        width: _currentPage == index ? 15 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFFE2BE7F)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Finish' : 'Next',
                      style: const TextStyle(color: Color(0xFFE2BE7F)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
