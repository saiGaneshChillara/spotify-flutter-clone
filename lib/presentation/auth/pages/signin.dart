import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/common/widgets/app_bar/app_bar.dart';
import 'package:myapp/common/widgets/button/basic_app_button.dart';
import 'package:myapp/core/configs/assets/app_vectors.dart';
import 'package:myapp/presentation/auth/pages/register.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signUpText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo, 
          height: 40, 
          width: 40
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(
              height: 50,
            ),
            _inputTextField(
              context,
              "Full Name",
            ),
            const SizedBox(
              height: 20,
            ),
            _inputTextField(
              context,
              "Enter Email",
            ),
            const SizedBox(
              height: 30,
            ),
            BasicAppButton(
              onPressed: () {},
              title: "Create Account",
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return Text(
      "Sign In",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _inputTextField(
    BuildContext context,
    String hintText,
  ) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Not a Member? ",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const RegisterPage(),
                )
              );
            },
            child: Text("Register now"),
          ),
        ],
      ),
    );
  }
}
