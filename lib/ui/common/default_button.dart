import 'package:averia_electronics/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.onPreset,
    required this.child,
  }) : super(key: key);

  final VoidCallback onPreset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: Material(
        color: colorButton,
        child: InkWell(
          child: child,
          onTap: onPreset,
        ),
      ),
    );
  }
}
