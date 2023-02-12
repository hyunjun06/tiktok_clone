import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/navigation/main_navigation_screen.dart';

enum Direction { left, right }

enum FadeState { showFirst, showSecond }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  FadeState _fadeState = FadeState.showFirst;

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _fadeState = FadeState.showSecond;
      });
    } else {
      setState(() {
        _fadeState = FadeState.showFirst;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v36,
                  const Text(
                    "Welcome to TikTok",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on"
                    "what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v36,
                  const Text(
                    "Follow the Rules",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on"
                    "what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                ],
              ),
              crossFadeState: _fadeState == FadeState.showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
              vertical: Sizes.size48,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _fadeState == FadeState.showFirst ? 0 : 1,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainNaviagtionScreen(),
                    ),
                    (route) => false,
                  );
                },
                color: Theme.of(context).primaryColor,
                child: const Text("Next"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
