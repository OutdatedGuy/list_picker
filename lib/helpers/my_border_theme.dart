// Flutter Packages
import 'package:flutter/material.dart';

InputBorder myBorderTheme(Color? color, double width) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: color ?? Colors.black,
        width: width,
      ),
    );
