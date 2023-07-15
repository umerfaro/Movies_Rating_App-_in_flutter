import 'package:flutter/material.dart';

import '../Color.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback onPressed;
  RoundButton(
      {required this.text, this.loading = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.ButtonColor,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Center(
              child: loading?CircularProgressIndicator(color: AppColors.WhiteColor,) :Text(text, style: TextStyle(color: AppColors.BlackColor))),
        ));
  }
}
