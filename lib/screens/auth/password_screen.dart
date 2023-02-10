import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/auth/birthday_screen.dart';
import 'package:tiktok_clone/screens/auth/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onClear() {
    _passwordController.clear();
  }

  void _onToggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _onOutsideTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  bool _isPasswordLengthVaild() {
    return _password.length >= 8 && _password.length <= 20;
  }

  bool _isPasswordFormatVaild() {
    final regExp = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()\-\\|=_+;:<>?`~.,/]).+");
    return regExp.hasMatch(_password);
  }

  bool _isPasswordValid() {
    return _isPasswordLengthVaild() && _isPasswordFormatVaild();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onOutsideTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Create password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v40,
              TextField(
                controller: _passwordController,
                onEditingComplete: _onSubmit,
                obscureText: _isObscure,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClear,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h20,
                      GestureDetector(
                        onTap: _onToggleObscure,
                        child: FaIcon(
                          _isObscure
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontSize: Sizes.size12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color:
                        _isPasswordLengthVaild() ? Colors.green : Colors.grey,
                    size: Sizes.size16,
                  ),
                  Gaps.h4,
                  const Text(
                    "At least 6 characters",
                    style: TextStyle(
                      fontSize: Sizes.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color:
                        _isPasswordFormatVaild() ? Colors.green : Colors.grey,
                    size: Sizes.size16,
                  ),
                  Gaps.h4,
                  const Text(
                    "Letters, numbers, and special characters",
                    style: TextStyle(
                      fontSize: Sizes.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Gaps.v36,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  isDisabled: !_isPasswordValid(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
