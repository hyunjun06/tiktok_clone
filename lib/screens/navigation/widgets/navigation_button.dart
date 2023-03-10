import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class NavigationButton extends StatelessWidget {
  final FaIcon icon;
  final String text;
  final bool isSelected;
  final Function onTap;

  const NavigationButton({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.black,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                Gaps.v5,
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
