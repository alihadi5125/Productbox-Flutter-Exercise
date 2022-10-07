import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingState({required double? size, required Color? color}) {
  return SpinKitThreeInOut(
    color: color,
    size: size!,
  );
}
