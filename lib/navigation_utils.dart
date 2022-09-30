import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/presentation/view/AddEditNoteScreen.dart';

void openAddNoteScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddEditNoteScreen(),
    ),
  );
}

void closeAddNoteScreen(BuildContext context) {
  Navigator.pop(context);
}
