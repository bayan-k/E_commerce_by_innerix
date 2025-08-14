import 'package:e_commerce_innerix/app/routes/app_pages.dart' as nav_routes;
import 'package:e_commerce_innerix/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> screens = [
    {
      'image': AppImages.illustration,
      'title': 'Welcome to ecom',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting!',
    },
    {
      'image': AppImages.illustration1,
      'title': 'It is a long established fact that a reader will !',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting!',
    },
    {
      'image': AppImages.illustration2,
      'title': 'Lorem Ipsum is simply dummy text of the printing !',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting!',
    },
  ];

  void handleNext() {
    if (currentIndex < screens.length - 1) {
      setState(() => currentIndex++);
    } else {
      Get.toNamed(nav_routes.Routes.SIGN_IN);
    }
  }

  void handleSkip() {
    Get.toNamed(nav_routes.Routes.SIGN_IN);
  }

  @override
  Widget build(BuildContext context) {
    final screen = screens[currentIndex];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 48),
              IllustrationWidget(imagePath: screen['image']!, height: 200),
              SizedBox(height: 32),
              TitleWidget(title: screen['title']!),
              SizedBox(height: 12),
              SubtitleWidget(subtitle: screen['subtitle']!),
              Spacer(),
              ProgressDots(currentIndex: currentIndex, count: screens.length),
              NavigationButtons(onSkip: handleSkip, onNext: handleNext),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const NavigationButtons({
    required this.onSkip,
    required this.onNext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: onSkip, child: Text('Skip')),
          TextButton(onPressed: onNext, child: Text('Next')),
        ],
      ),
    );
  }
}

class ProgressDots extends StatelessWidget {
  final int currentIndex;
  final int count;

  const ProgressDots({
    required this.currentIndex,
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == currentIndex ? Colors.black : Colors.grey[300],
          ),
        );
      }),
    );
  }
}

class SubtitleWidget extends StatelessWidget {
  final String subtitle;
  const SubtitleWidget({required this.subtitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        subtitle,
        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class IllustrationWidget extends StatelessWidget {
  final String imagePath;
  final double height;

  const IllustrationWidget({
    required this.imagePath,
    this.height = 200,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
