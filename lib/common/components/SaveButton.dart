import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onBtnTap;
  final String btnText;

  const SaveButton({Key? key, required this.onBtnTap, required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onBtnTap,
      child: Text(btnText),
    );
  }
}
