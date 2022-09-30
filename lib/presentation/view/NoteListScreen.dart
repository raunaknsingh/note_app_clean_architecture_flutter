import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/common/constants/StringConstants.dart';
import 'package:notes_app_clean_arch_flutter/domain/model/NoteModel.dart';
import 'package:notes_app_clean_arch_flutter/presentation/viewmodel/NoteViewModel.dart';
import 'package:provider/provider.dart';

import '../../common/components/NoteItemComponent.dart';
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
    final List<NoteModel> notesList = noteViewModel.noteList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(NOTES_LIST),
      ),
      // body: _populateNoteList(noteViewModel),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          openAddNoteScreen(context);
        },
      ),
      body: noteViewModel.isLoading
          ? Center(child: const CircularProgressIndicator())
          : notesList.isEmpty
              ? Center(
                  child: Text(
                    'No notes present',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: noteViewModel.noteList.length,
                  itemBuilder: (context, index) {
                    final item = noteViewModel.noteList[index].id.toString();
                    return Dismissible(
                      key: Key(item),
                      onDismissed: (direction) {
                        noteViewModel.deleteNote(noteViewModel.noteList[index]);
                        setState(() {
                          notesList.removeAt(index);
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          noteViewModel.setSelectedNoteItem(
                              noteViewModel.noteList[index]);
                          openAddNoteScreen(
                            context,
                          );
                        },
                        child: NoteItemComponent(
                          noteId: noteViewModel.noteList[index].id.toString(),
                          noteTitle: noteViewModel.noteList[index].title ?? '',
                          noteDescription:
                              noteViewModel.noteList[index].description ?? '',
                          isNoteEdited: noteViewModel.noteList[index].isEdited,
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
