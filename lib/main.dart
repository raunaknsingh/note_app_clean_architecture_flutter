import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/presentation/view/NoteListScreen.dart';
import 'package:notes_app_clean_arch_flutter/presentation/viewmodel/NoteViewModel.dart';
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
        title: 'NoteApp clean arch',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NoteListScreen(),
      ),
    );
  }
}
