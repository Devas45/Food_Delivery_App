import 'package:flutter/material.dart';
import 'package:oyw/SignUp/components/sign_upform.dart';
import 'package:oyw/SignUp/components/sign_up_top_image.dart';
import 'package:oyw/SignUp/components/social_sign_up.dart';
import 'package:oyw/responsive.dart';
import 'package:oyw/components/background.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackGround(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileSignUpScreen(),
          desktop: Row(
            children : [
              Expanded(child: SignUpTopImage(),),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: SignUpForm(),
                    )
                  ],
                )
              )
            ],
          )
        ),
      )
    );
  }
}


class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SignUpTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(flex : 8,child: SignUpForm()),
            Spacer(),
          ],
        ),
        SocialSignUp()
      ],
    );
  }
}