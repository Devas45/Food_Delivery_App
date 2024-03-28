import 'package:flutter/material.dart';
import 'package:oyw/components/already_have_an_account.dart';
import 'package:oyw/constants.dart';
import 'package:oyw/login/login_screen.dart';

class SignUpForm  extends StatelessWidget {
  const SignUpForm ({Key ? key}):super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor : kPrimaryColour,
          onSaved: (email){},
          decoration : const InputDecoration(
            hintText : "Your Email",
            prefixIcon : Padding(
              padding : EdgeInsets.all(kDefaultPadding),
              child : Icon(Icons.person),
            )
          ),
        ),
        Padding(
          padding:EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor : kPrimaryColour,
            decoration : const InputDecoration(
              hintText : "Your Password",
              prefixIcon : Padding(
                padding : EdgeInsets.all(kDefaultPadding),
                child : Icon(Icons.lock),
              )
            ),
          ),
        ),
        const SizedBox(height : kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {},
          child: Text("Sign Up".toUpperCase()),
        ),
        const SizedBox(height : kDefaultPadding / 2),
        CheckExistingAccount(
          login : false,
          press: () {
            Navigator.push(
              context,
                MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }
              )
            );
          }
        )
      ]
    );
  }
}