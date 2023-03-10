import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/auth/log_in_screen.dart';
import 'package:tiktok_clone/screens/auth/username_screen.dart';
import 'package:tiktok_clone/screens/auth/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLogInTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LogInScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: const [
              Gaps.v80,
              Text(
                "Sign up for TikTok",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v20,
              Text(
                "Create a profile, follow other accounts,"
                " make your own videos, and more.",
                style: TextStyle(fontSize: Sizes.size16, color: Colors.black45),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.user),
                text: "Use email & password",
                screen: UsernameScreen(),
              ),
              Gaps.v16,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
                screen: UsernameScreen(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => onLogInTap(context),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
