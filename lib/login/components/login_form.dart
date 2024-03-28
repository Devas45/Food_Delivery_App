import 'package:flutter/material.dart';
import 'package:oyw/SignUp/signUpScreen.dart';
import 'package:oyw/components/already_have_an_account.dart';
import 'package:oyw/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key ? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColour,
              onSaved: (email) {},
                decoration: const InputDecoration(
                hintText: "Your Email",
                prefixIcon : Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Icon(Icons.person),
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColour,
                  decoration: const InputDecoration(
                  hintText: "Your Password",
                  prefixIcon : Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Icon(Icons.lock),
                  )
                )
              ),
            ),
            const SizedBox(height : kDefaultPadding / 2),
            Hero(
              tag : "login_btn",
              child: ElevatedButton(
                onPressed:() {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder : (context) {
                  //     return HomePage();
                  //     }
                  //   )
                  // );
                },
                child: Text(
                  "Login".toUpperCase(),
                 ),
              )
            ),
            const SizedBox(height: kDefaultPadding,),
            CheckExistingAccount(
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder : (context) {
                      return SignUpScreen();
                      }
                    )
                  );
              },
            )
          ],
        ),
    );
  }
}