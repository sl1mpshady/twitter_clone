import 'package:flutter/material.dart';
import 'package:twitter_clone/widgets/avatar/avatar.dart';

Widget userThumbnail(BuildContext context) {
  return Stack(
    children: [
      Avatar(
          radius: 100,
          image: Image.asset(
            'assets/images/xKgTpvdh_400x400.jpeg',
            fit: BoxFit.cover,
            height: 35,
          )),
      Positioned(
        top: 2.5,
        right: 0,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF4c9eeb),
                  border: Border.all(
                      color: Theme.of(context).backgroundColor, width: 1.5),
                  borderRadius: BorderRadius.circular(50)),
              width: 12,
              height: 12,
            )),
      )
    ],
  );
}
