import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/common/constants/StringConstants.dart';
import 'package:notes_app_clean_arch_flutter/presentation/viewmodel/NoteViewModel.dart';
import 'package:provider/provider.dart';

import '../../navigation_utils.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    NoteViewModel noteViewModel = context.watch<NoteViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(NOTES_LIST),
      ),
      // body: _populateNoteList(noteViewModel),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          openAddNoteScreen(context);
          // noteViewModel.insertNote(NoteMode())
        },
      ),
    );
  }

  // _populateNoteList(NoteViewModel noteViewModel) async {
  //   noteViewModel.in
  // }
}
