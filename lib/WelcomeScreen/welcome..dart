// ignore: file_names
import 'package:flutter/material.dart';
import 'package:oyw/components/background.dart';
import 'components/welcome_image.dart';
import 'components/login_signup.dart';
import 'package:oyw/responsive.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const BackGround(
        child: SingleChildScrollView(
            child: SafeArea(
                child: Responsive(
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: WelcomeImage()),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(
                  width: 450,
                  child: LoginAndSignUpBtn(),
                ),
              ],
            ),
          ),
        ],
      ),
      mobile: MobileWelcomeScreen(),
    ))));
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WelcomeImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignUpBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
