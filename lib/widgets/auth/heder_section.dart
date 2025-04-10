import 'package:flutter/material.dart';
import 'package:qasim_profile_info/widgets/auth/custome_shape.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.headerText});
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 350),
          painter: HeaderPainter(),
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              headerText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
