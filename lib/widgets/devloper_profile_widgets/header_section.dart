import 'package:flutter/material.dart';

class HeaderSectionDev extends StatelessWidget {
  const HeaderSectionDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: 300,
          width: double.infinity,
          child: ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              color: Theme.of(context).primaryColor, // لون الثيم الأساسي
              height: 2,
              width: double.infinity,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: CircleAvatar(
              radius: 80,
              child: Image.asset("assets/my_prefere.jpg"),
            ),
          ),
        ),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
