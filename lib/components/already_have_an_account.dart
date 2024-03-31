import 'package:flutter/material.dart';
import 'package:oyw/constants.dart';

class CheckExistingAccount extends StatelessWidget {
  final bool login;
  final Function press;
  
  const CheckExistingAccount({
    Key ? key,
    this.login = true,
    required this.press,
    }):super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children : <Widget>[
        Text(
          login ? "Don't have an account ? " : "Already have an account : ",
          style: TextStyle(color: kPrimaryColour)
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child:Text(
            login? "Sign Up" : "Login",
            style: const TextStyle(
              color: kPrimaryColour,
              fontWeight: FontWeight.bold,
            )
          )
        )
      ],
    );
  }
}