import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/videoes/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();
  int _pageCount = 3;

  void _onPageChange(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );

    if (_pageCount <= page + 2) {
      _pageCount++;
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _pageCount = 3;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      edgeOffset: 20,
      displacement: 50,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pageCount,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChange,
        itemBuilder: (context, index) => VideoPost(
          index: index,
        ),
      ),
    );
  }
}
