import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/common/error/UserError.dart';
import 'package:notes_app_clean_arch_flutter/common/params/NoParams.dart';
import 'package:notes_app_clean_arch_flutter/common/params/NoteParams.dart';
import 'package:notes_app_clean_arch_flutter/data/database/DatabaseHelper.dart';
import 'package:notes_app_clean_arch_flutter/data/repository/NoteRepositoryImpl.dart';
import 'package:notes_app_clean_arch_flutter/domain/model/NoteModel.dart';
import 'package:notes_app_clean_arch_flutter/domain/usecase/DeleteNoteUsecase.dart';
import 'package:notes_app_clean_arch_flutter/domain/usecase/InsertNoteUsecase.dart';
import 'package:notes_app_clean_arch_flutter/domain/usecase/GetAllNoteUsecase.dart';
import 'package:notes_app_clean_arch_flutter/domain/usecase/UpdateNoteUsecase.dart';

class NoteViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<NoteModel> _noteList = [];
  List<NoteModel> get noteList => _noteList;

  UserError? _userError;
  UserError? get userError => _userError;

  InsertNoteUsecase insertNoteUseCase = InsertNoteUsecase(
    noteRepository: NoteRepositoryImpl(databaseHelper: DatabaseHelper.instance),
  );

  GetAllNoteUsecase getAllNoteUsecase = GetAllNoteUsecase(
    noteRepository: NoteRepositoryImpl(databaseHelper: DatabaseHelper.instance),
  );

  DeleteNoteUsecase deleteNoteUsecase = DeleteNoteUsecase(
    noteRepository: NoteRepositoryImpl(databaseHelper: DatabaseHelper.instance),
  );

  UpdateNoteUsecase updateNoteUsecase = UpdateNoteUsecase(
    noteRepository: NoteRepositoryImpl(databaseHelper: DatabaseHelper.instance),
  );

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setNoteList(List<NoteModel> noteList) {
    _noteList = noteList;
  }

  insertNote(NoteModel note) async {
    setLoading(false);
    var response = await insertNoteUseCase.call(NoteParams(note));
    refreshNoteListOrShowError(response);
    setLoading(true);
  }

  getAllNotes() async {
    setLoading(false);
    var response = await getAllNoteUsecase.call(NoParams());
    refreshNoteListOrShowError(response);
    setLoading(true);
  }

  updateNote(NoteModel note) async {
    setLoading(false);
    var response = await updateNoteUsecase.call(NoteParams(note));
    refreshNoteListOrShowError(response);
    setLoading(true);
  }

  deleteNote(NoteModel note) async {
    setLoading(false);
    var response = await deleteNoteUsecase.call(NoteParams(note));
    refreshNoteListOrShowError(response);
    setLoading(true);
  }

  refreshNoteListOrShowError(dynamic response) {
    response.fold((l) {
      setUserError(UserError(errorMessage: l.errorMessage));
    }, (r) {
      setNoteList(noteList);
    });
  }
}
