import "package:flutter/material.dart";
import "package:tiktok_clone/constants/gaps.dart";
import "package:tiktok_clone/constants/sizes.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:tiktok_clone/screens/navigation/widgets/upload_button.dart";
import "package:tiktok_clone/screens/videoes/video_timeline_screen.dart";
import "widgets/navigation_button.dart";

class MainNaviagtionScreen extends StatefulWidget {
  const MainNaviagtionScreen({super.key});

  @override
  State<MainNaviagtionScreen> createState() => _MainNaviagtionScreenState();
}

class _MainNaviagtionScreenState extends State<MainNaviagtionScreen> {
  int _selectedIndex = 0;

  final screens = const [
    VideoTimelineScreen(),
    Center(
      child: Text(
        "Friends",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        "Upload",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        "Inbox",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        "Profile",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          for (int i = 0; i < screens.length; i++)
            Offstage(
              offstage: _selectedIndex != i,
              child: screens[i],
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationButton(
                isSelected: _selectedIndex == 0,
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                  size: Sizes.size20,
                ),
                text: "홈",
                onTap: () => _onTap(0),
              ),
              NavigationButton(
                isSelected: _selectedIndex == 1,
                icon: const FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                  size: Sizes.size20,
                ),
                text: "친구",
                onTap: () => _onTap(1),
              ),
              Gaps.h14,
              GestureDetector(
                onTap: () => _onTap(2),
                child: const UploadButton(),
              ),
              Gaps.h14,
              NavigationButton(
                isSelected: _selectedIndex == 3,
                icon: const FaIcon(
                  FontAwesomeIcons.message,
                  color: Colors.white,
                  size: Sizes.size20,
                ),
                text: "알림",
                onTap: () => _onTap(3),
              ),
              NavigationButton(
                isSelected: _selectedIndex == 4,
                icon: const FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                  size: Sizes.size20,
                ),
                text: "프로필",
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
