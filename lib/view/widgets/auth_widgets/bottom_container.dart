import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerUnder extends StatelessWidget {
  final String text1, text2;
  final Function() onPressed;

  ContainerUnder({
    required this.text1,
    required this.text2,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text1,
              fontSize: 17,
              textColor: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                text: text2,
                textColor: Colors.white,
                fontSize: 18,
                underLine: TextDecoration.underline,
              )),
        ],
      ),
    );
  }
}
