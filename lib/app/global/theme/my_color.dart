import 'package:flutter/material.dart';

const Color primary = Color(0xFFBB86FC);
const Color primaryVariant = Color(0xFF3700B3);
const Color secondary = Color(0xFF03DAC6);

const Color background = Color(0xFF121212);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
