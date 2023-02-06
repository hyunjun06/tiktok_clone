import "package:flutter/material.dart";
import "package:tiktok_clone/constants/sizes.dart";

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isDisabled,
  });

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          color: isDisabled
              ? Colors.grey.shade300
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(Sizes.size4),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: isDisabled ? Colors.grey : Colors.white,
          ),
          child: const Text(
            "Next",
            style: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
