import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -Sizes.size5,
          child: Container(
            width: Sizes.size48,
            height: Sizes.size32,
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.all(
                Radius.circular(Sizes.size10),
              ),
            ),
          ),
        ),
        Positioned(
          right: -Sizes.size5,
          child: Container(
            width: Sizes.size48,
            height: Sizes.size32,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(Sizes.size10),
              ),
            ),
          ),
        ),
        Container(
          width: Sizes.size44,
          height: Sizes.size32,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(Sizes.size10),
            ),
          ),
          child: const FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.black,
            size: Sizes.size20,
          ),
        ),
      ],
    );
  }
}
