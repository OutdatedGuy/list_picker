// Flutter Packages
import 'package:flutter/material.dart';

/// Boder Decoration for the [TextField].
InputBorder myBorderTheme(Color? color, double width) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? Colors.black,
        width: width,
      ),
    );
