import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/common/constants/string_constants.dart';
import 'package:notes_app_clean_arch_flutter/presentation/view/note_list_screen.dart';
import 'package:notes_app_clean_arch_flutter/presentation/viewmodel/note_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NoteViewModel())],
      child: MaterialApp(
        title: noteAppCleanArch,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NoteListScreen(),
      ),
    );
  }
}
