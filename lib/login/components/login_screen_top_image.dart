import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oyw/constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
          Text(
          "LOGIN",
          style: Theme.of(context).textTheme.headline4,
          textAlign:TextAlign.center,
        ),
        const SizedBox(height: kDefaultPadding),
        Row(
          children: [
            const Spacer(),
            Container(
              height: 300,
              width: 100,
              child: SvgPicture.asset("assets/icons/delivery.svg"),
            ),
            const Spacer(),
          ]
        ),
        const SizedBox(height: kDefaultPadding * 2)
      ],
    );
  }
}