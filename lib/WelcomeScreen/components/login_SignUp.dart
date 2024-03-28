import 'package:flutter/material.dart';
import 'package:oyw/constants.dart';
import 'package:oyw/login/login_screen.dart';

class LoginAndSignUpBtn extends StatelessWidget {
  const LoginAndSignUpBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    }
                  )
                );
              },
              child: Text("Login".toUpperCase()),
            )),
        const SizedBox(height: kDefaultPadding),
        Hero(
            tag: "login_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryLightColour,
                elevation: 0,
              ),
              onPressed: () {},
              child: Text("Sign Up".toUpperCase(),
                  style: TextStyle(color: Colors.black)),
            )),
      ],
    );
  }
}
