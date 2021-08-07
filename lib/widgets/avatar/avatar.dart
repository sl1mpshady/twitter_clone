import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({Key key, this.radius = 100, this.image})
      : assert(radius != null),
        assert(image != null),
        super(key: key);
  final double radius;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
          radius: radius,
          backgroundColor: Theme.of(context).backgroundColor,
          child:
              ClipRRect(borderRadius: BorderRadius.circular(50), child: image)),
    );
  }
}
