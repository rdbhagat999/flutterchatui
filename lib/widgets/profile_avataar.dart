import 'package:flutter/material.dart';

class ProfileAvataar extends StatelessWidget {
  final String imageUrl;
  final double radius;

  ProfileAvataar({this.imageUrl, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue,
          width: 3,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(
          imageUrl,
        ),
      ),
    );
  }
}
