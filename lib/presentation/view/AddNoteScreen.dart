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

  final formKey = GlobalKey<FormState>();
  String _noteTitle = '';
  String _noteDesc = '';
  bool _isEdited = false;
  String _noteId = '';

  @override
  Widget build(BuildContext context) {
    NoteViewModel noteViewModel = context.watch<NoteViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(ADD_NOTE),
      ),
      body: Form(
        key: formKey,
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
    );
  }

  Widget _buildTitleInput() {
    return TextInputComponent(
      onInputSaved: (input) {
        _noteTitle = input;
      },
      inputTitle: NOTE_TITLE,
      inputDescription: ENTER_NOTE_TITLE,
    );
  }

  Widget _buildDescriptionInput() {
    return TextInputComponent(
      onInputSaved: (input) {
        _noteDesc = input;
      },
      inputTitle: NOTE_DESCRIPTION,
      inputDescription: ENTER_NOTE_DESCRIPTION,
    );
  }

  Widget _buildSaveButton(NoteViewModel noteViewModel, BuildContext context) {
    return SaveButton(onBtnTap: () {
      noteViewModel.insertNote(
        NoteModel(
            id: int.parse(_noteId),
            title: _noteTitle,
            description: _noteDesc,
            isEdited: _isEdited),
      );
      closeAddNoteScreen(context);
    });
  }
}
