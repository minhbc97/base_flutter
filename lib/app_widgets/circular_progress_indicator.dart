import 'package:base_flutter/constants/dimens.dart';
import 'package:flutter/material.dart';

class NxCircularProgressIndicator extends StatelessWidget {
  const NxCircularProgressIndicator({
    Key? key,
    this.size,
    this.strokeWidth,
    this.color,
    this.value,
  }) : super(key: key);

  final double? size;
  final double? strokeWidth;
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? Dimens.sixTeen,
      height: size ?? Dimens.sixTeen,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? Dimens.three,
        color: color ?? Colors.blue,
        value: value,
      ),
    );
  }
}
