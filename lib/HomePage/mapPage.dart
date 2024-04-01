import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.symmetric(horizontal : 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 83, 69, 164),
              const Color.fromARGB(255, 66, 53, 165).withOpacity(.8),
              const Color.fromARGB(255, 75, 53, 165).withOpacity(.6),
              const Color.fromARGB(255, 121, 112, 159).withOpacity(.4),
              const Color.fromARGB(255, 70, 53, 165).withOpacity(.2),
              const Color(0xFF6F35A5).withOpacity(.1),
              const Color(0xFF6F35A5).withOpacity(.05),
              const Color(0xFF6F35A5).withOpacity(.025),
            ],
          ),
        ),
        child : Scaffold(
        backgroundColor: Colors.transparent,
        appBar : AppBar(
          backgroundColor: Colors.transparent,
          title : Text('Map',style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.black)),
          elevation: 0,
        ),
        body : Container(
          child : Column(children: [
            Text('Based on your Location,here are the nearest restaurants',style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black))
          ],)
        )
        ),
    );
  }
}