import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/common/components/SaveButton.dart';
import 'package:notes_app_clean_arch_flutter/common/components/TextInputComponent.dart';
import 'package:notes_app_clean_arch_flutter/common/constants/StringConstants.dart';
import 'package:notes_app_clean_arch_flutter/domain/model/NoteModel.dart';
import 'package:notes_app_clean_arch_flutter/navigation_utils.dart';
import 'package:notes_app_clean_arch_flutter/presentation/viewmodel/NoteViewModel.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatelessWidget {
  AddEditNoteScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String _noteTitle = '';
  String _noteDesc = '';
  String _noteId = '';
  NoteModel? _selectedNote;

  @override
  Widget build(BuildContext context) {
    NoteViewModel noteViewModel = context.watch<NoteViewModel>();
    _selectedNote = noteViewModel.selectedNote;
    setNoteData();
    return Scaffold(
      appBar: AppBar(
        title: Text(ADD_NOTE),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildNoteIdInput(),
            _buildTitleInput(),
            _buildDescriptionInput(),
            _buildSaveButton(noteViewModel, context),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteIdInput() {
    return TextInputComponent(
      onInputSaved: (input) {
        _noteId = input;
      },
      textInputType: TextInputType.number,
      inputTitle: NOTE_ID,
      inputDescription: ENTER_NOTE_ID,
      noteData: _selectedNote?.id.toString(),
    );
  }

  Widget _buildTitleInput() {
    return TextInputComponent(
        onInputSaved: (input) {
          _noteTitle = input;
        },
        inputTitle: NOTE_TITLE,
        inputDescription: ENTER_NOTE_TITLE,
        noteData: _selectedNote?.title.toString());
  }

  Widget _buildDescriptionInput() {
    return TextInputComponent(
        onInputSaved: (input) {
          _noteDesc = input;
        },
        inputTitle: NOTE_DESCRIPTION,
        inputDescription: ENTER_NOTE_DESCRIPTION,
        noteData: _selectedNote?.description.toString());
  }

  Widget _buildSaveButton(NoteViewModel noteViewModel, BuildContext context) {
    return SaveButton(onBtnTap: () {
      if (_formKey.currentState!.validate()) {
        _selectedNote == null
            ? noteViewModel.insertNote(
                NoteModel(
                  id: int.parse(_noteId),
                  title: _noteTitle,
                  description: _noteDesc,
                  isEdited: false,
                ),
              )
            : noteViewModel.updateNote(
                NoteModel(
                  id: int.parse(_noteId),
                  title: _noteTitle,
                  description: _noteDesc,
                  isEdited: true,
                ),
              );
        closeAddNoteScreen(context);
      }
    });
  }

  void setNoteData() {
    if (_selectedNote == null) {
      return;
    }
    _noteId = _selectedNote!.id.toString();
    _noteTitle = _selectedNote!.title!;
    _noteDesc = _selectedNote!.description!;
  }
}
