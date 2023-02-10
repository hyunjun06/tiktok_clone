import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/onboarding/interests_screen.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/auth/widgets/form_button.dart';

class LogInFormScreen extends StatefulWidget {
  const LogInFormScreen({super.key});

  @override
  State<LogInFormScreen> createState() => _LogInFormScreenState();
}

class _LogInFormScreenState extends State<LogInFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _isEmailValid(value) {
    final regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@"
        "[a-zA-Z0-9]+${RegExp.escape(".")}[a-zA-Z]+");

    if (regExp.hasMatch(value)) return null;

    return "Invalid email";
  }

  void _onSubmit() {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InterestsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: _isEmailValid,
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
                obscureText: true,
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: const FormButton(isDisabled: false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
