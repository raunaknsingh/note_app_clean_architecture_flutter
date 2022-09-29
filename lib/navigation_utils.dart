import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/presentation/view/AddNoteScreen.dart';

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
