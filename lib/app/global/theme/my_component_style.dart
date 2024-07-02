import 'package:flutter/material.dart';
import 'package:myapp/app/global/theme/my_color.dart';

AppBarTheme myAppBarStyle() => const AppBarTheme(
  centerTitle: true,
  iconTheme: IconThemeData(color: Colors.white),
  foregroundColor: Colors.white,
  backgroundColor: background,
  elevation: 1.0
);

ElevatedButtonThemeData myElevatedButtonThemeStyle() => ElevatedButtonThemeData(
  style: ButtonStyle(
   shape:  WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
   backgroundColor: WidgetStatePropertyAll(primaryVariant)
  )
);

InputDecorationTheme myInputDecorationTheme() => const InputDecorationTheme(
  border: OutlineInputBorder(),
);

IconThemeData myIconStyle() => const IconThemeData(
  color: Colors.black
);