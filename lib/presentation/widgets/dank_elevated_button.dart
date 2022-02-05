import 'package:flutter/material.dart';

import '../../core/themes/dank_colors.dart';

class DankElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const DankElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color = DankColors.dankDarkGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
