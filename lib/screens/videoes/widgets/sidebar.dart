import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/screens/videoes/widgets/sidebar_controller.dart';

import '../../../constants/sizes.dart';

class Sidebar extends StatefulWidget {
  final AssetImage image;
  final Function onCommentTap;
  final SidebarController sidebarController;

  const Sidebar({
    super.key,
    required this.image,
    required this.onCommentTap,
    required this.sidebarController,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with TickerProviderStateMixin {
  late final AnimationController _heartAnimationController,
      _bookmarkAnimationController;
  bool _isHeartActivated = false;
  bool _isBookmarkActivated = false;

  @override
  void initState() {
    super.initState();
    widget.sidebarController.onHeartTap = _onHeartTap;
    _heartAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.25,
      upperBound: 1,
    )
      ..stop()
      ..value = 1;
    _bookmarkAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.25,
      upperBound: 1,
    )
      ..stop()
      ..value = 1;
  }

  @override
  void dispose() {
    _heartAnimationController.dispose();
    super.dispose();
  }

  void _onHeartTap() {
    _isHeartActivated = !_isHeartActivated;

    if (_isHeartActivated) {
      _heartAnimationController.value = 0.25;
      _heartAnimationController.forward();
    }

    setState(() {});
  }

  void _onBookmarkTap() {
    _isBookmarkActivated = !_isBookmarkActivated;

    if (_isBookmarkActivated) {
      _bookmarkAnimationController.value = 0.25;
      _bookmarkAnimationController.forward();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Sizes.size10,
      bottom: Sizes.size32,
      child: Column(
        children: [
          ProfileButton(image: widget.image),
          Gaps.v28,
          ScaleTransition(
            scale: CurvedAnimation(
              parent: _heartAnimationController,
              curve: Curves.elasticOut,
            ),
            child: GestureDetector(
              onTap: _onHeartTap,
              child: SidebarButton(
                icon: FontAwesomeIcons.solidHeart,
                text: "527.4K",
                color: _isHeartActivated
                    ? Theme.of(context).primaryColor
                    : Colors.white,
              ),
            ),
          ),
          Gaps.v28,
          GestureDetector(
            onTap: () => widget.onCommentTap(context),
            child: const SidebarButton(
              icon: FontAwesomeIcons.solidMessage,
              text: "990",
              color: Colors.white,
            ),
          ),
          Gaps.v28,
          ScaleTransition(
            scale: CurvedAnimation(
              parent: _bookmarkAnimationController,
              curve: Curves.elasticOut,
            ),
            child: GestureDetector(
              onTap: _onBookmarkTap,
              child: SidebarButton(
                icon: FontAwesomeIcons.solidBookmark,
                text: "42.6K",
                color: _isBookmarkActivated ? Colors.yellow : Colors.white,
              ),
            ),
          ),
          Gaps.v28,
          const SidebarButton(
            icon: FontAwesomeIcons.solidShareFromSquare,
            text: "공유",
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const SidebarButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          color: color,
          size: Sizes.size32,
        ),
        Gaps.v5,
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.image,
  });

  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: Sizes.size56,
          height: Sizes.size56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size28),
          ),
          child: CircleAvatar(
            backgroundImage: image,
            radius: Sizes.size28 - Sizes.size2,
          ),
        ),
        Positioned(
          bottom: -Sizes.size8,
          left: Sizes.size16,
          child: Container(
            width: Sizes.size24,
            height: Sizes.size24,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size12),
            ),
            alignment: Alignment.center,
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: Sizes.size16,
            ),
          ),
        )
      ],
    );
  }
}
