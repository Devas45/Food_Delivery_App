import 'package:flutter/material.dart';
import 'package:oyw/login/components/login_form.dart';
import 'package:oyw/login/components/login_screen_top_image.dart';
import 'package:oyw/responsive.dart';
import 'package:oyw/components/background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackGround(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(),
          desktop: Row(
            children : [
              Expanded(child: LoginScreenTopImage(),),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(),
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


class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoginScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(flex : 8,child: LoginForm()),
            Spacer(),
          ]
        )
      ],
    );
  }
}