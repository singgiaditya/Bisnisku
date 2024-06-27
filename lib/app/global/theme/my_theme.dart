import 'package:flutter/material.dart';
import 'package:myapp/app/global/theme/my_color.dart';
import 'package:myapp/app/global/theme/my_component_style.dart';

class Themes{
  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    appBarTheme: myAppBarStyle(),
    elevatedButtonTheme: myElevatedButtonThemeStyle(),
    inputDecorationTheme: myInputDecorationTheme(),
    iconTheme: myIconStyle()
  );
}