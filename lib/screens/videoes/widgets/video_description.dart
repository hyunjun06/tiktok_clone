import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class VideoDescription extends StatelessWidget {
  final String username, description, hashtags, music;

  const VideoDescription({
    super.key,
    required this.username,
    required this.description,
    required this.hashtags,
    required this.music,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Sizes.size10,
      left: Sizes.size10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size20,
            ),
          ),
          Gaps.v10,
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: Sizes.size16,
            ),
          ),
          Text(
            hashtags,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v10,
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.music,
                color: Colors.white,
                size: Sizes.size16,
              ),
              Gaps.h10,
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: Sizes.size72 * 3),
                child: TextScroll(
                  music,
                  mode: TextScrollMode.endless,
                  velocity: const Velocity(
                    pixelsPerSecond: Offset(Sizes.size28, 0),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
