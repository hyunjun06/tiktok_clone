import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/videoes/widgets/sidebar.dart';
import 'package:tiktok_clone/screens/videoes/widgets/sidebar_controller.dart';
import 'package:tiktok_clone/screens/videoes/widgets/video_comments.dart';
import 'package:tiktok_clone/screens/videoes/widgets/video_description.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final int index;

  const VideoPost({super.key, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> with TickerProviderStateMixin {
  final VideoPlayerController _playerController =
      VideoPlayerController.asset("assets/videos/video2.mp4");
  final SidebarController _sidebarController = SidebarController();
  bool _isDisposed = false, _isPlaying = true;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _playerController.initialize().then((_) {
      _playerController.setLooping(true);
      setState(() {});
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    _playerController.dispose();
    super.dispose();
  }

  void _onPlayPause() {
    if (_playerController.value.isPlaying) {
      _isPlaying = false;
      _playerController.pause();
      _animationController.reverse();
    } else {
      _isPlaying = true;
      _playerController.play();
      _animationController.forward();
    }
    setState(() {});
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_isDisposed &&
        info.visibleFraction == 1 &&
        !_playerController.value.isPlaying) {
      _isPlaying = true;
      _playerController.play();
    }
  }

  void _onCommentTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const VideoComments(),
    );
  }

  void _onDoubleTap() {
    _sidebarController.onHeartTap();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("video-post-${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _playerController.value.isInitialized
                ? VideoPlayer(_playerController)
                : Container(),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onPlayPause,
              onDoubleTap: _onDoubleTap,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Transform.scale(
                    scale: _animationController.value,
                    child: child,
                  ),
                  child: AnimatedOpacity(
                    opacity: _isPlaying ? 0 : 1,
                    duration: const Duration(milliseconds: 100),
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white.withOpacity(0.3),
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const VideoDescription(
            username: "이센찌",
            description: "열심히 춰놓고 마지막에 눈치 보는 게 킬포",
            hashtags: "#추천 #나문희의첫사랑 #2023",
            music: "banana shake (포함된 음악: Banana Shake)",
          ),
          Sidebar(
            image: const AssetImage(
              "assets/images/pfp1.jpg",
            ),
            onCommentTap: _onCommentTap,
            sidebarController: _sidebarController,
          )
        ],
      ),
    );
  }
}
