import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oyw/constants.dart';

class SignUpTopImage extends StatelessWidget {
  const SignUpTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SIgn Up".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold,fontSize : 10),
        ),
        const SizedBox(height : kDefaultPadding),
        Row(
          children: [
            const Spacer(),
            Container(
              height : 300,
              width : 300,
              child: SvgPicture.asset("assets/images/Eating.svg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height : kDefaultPadding),
      ]
    );
  }
}