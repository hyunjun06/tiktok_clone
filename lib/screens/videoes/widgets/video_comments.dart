import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  Random random = Random();

  void _onDismiss() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size14),
          topRight: Radius.circular(Sizes.size14),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("댓글 990개"),
          actions: [
            IconButton(
              onPressed: _onDismiss,
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.black,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => Comment(
            random: random,
            index: index,
            username: "User $index",
            comment: "Comment $index",
          ),
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final int index;
  final String username, comment;

  const Comment({
    super.key,
    required this.random,
    required this.index,
    required this.username,
    required this.comment,
  });

  final Random random;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Sizes.size40,
              height: Sizes.size40,
              decoration: BoxDecoration(
                color: Colors.primaries[index % Colors.primaries.length],
                borderRadius: BorderRadius.circular(Sizes.size28),
              ),
            ),
            Gaps.h10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    comment,
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.v10,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "${random.nextInt(10)}시간 전",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gaps.h10,
                      GestureDetector(
                        child: const Text(
                          "회신",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const FaIcon(
                                FontAwesomeIcons.heart,
                                color: Colors.grey,
                                size: Sizes.size16,
                              ),
                            ),
                            Gaps.h40,
                            GestureDetector(
                              onTap: () {},
                              child: const FaIcon(
                                FontAwesomeIcons.thumbsDown,
                                color: Colors.grey,
                                size: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
