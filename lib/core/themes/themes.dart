import 'package:flutter/material.dart';

class Thems {
  // Define the dark theme
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xff0D47A1), // Sets the primary color for dark mode
    iconTheme: IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff0D47A1), // Sets button color for dark mode
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(
        0xff0D47A1,
      ), // Sets app bar background color in dark mode
    ),
  );
  //---------------------------------------------------------------------
  // Define the light theme
  static ThemeData lightTheme = ThemeData.light().copyWith(
    iconTheme: IconThemeData(color: Colors.black),
    primaryColor: Color(0xff0FA4DC), // Sets the primary color for light mode

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff13ABDC), // Sets button color for light mode
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(
        0xff0FA4DC,
      ), // Sets app bar background color in light mode
    ),
  );
}
