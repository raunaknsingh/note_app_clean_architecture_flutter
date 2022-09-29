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
        child: const Icon(Icons.add),
        onPressed: () {
          openAddNoteScreen(context);
        },
      ),
      body: noteViewModel.isLoading
          ? Center(child: const CircularProgressIndicator())
          : noteViewModel.noteList.isEmpty
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
                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: Colors.purple),
                      child: Column(
                        children: [
                          Text(
                            noteViewModel.noteList[index].id.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            noteViewModel.noteList[index].title ?? '',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            noteViewModel.noteList[index].description ?? '',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
