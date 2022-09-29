import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/common/constants/StringConstants.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onBtnTap;

  SaveButton({required this.onBtnTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onBtnTap,
      child: const Text(SAVE_NOTE),
    );
  }
}
