import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  Function() onPressed;
  AuthButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: mainColor, minimumSize: const Size(360, 50)),
      onPressed: onPressed,
      child: TextUtils(
        underLine: TextDecoration.none,
        fontSize: 18,
        text: text,
        textColor: Colors.white,
      ),
    );
  }
}
