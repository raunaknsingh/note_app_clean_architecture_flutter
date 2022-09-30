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

  NoteModel? _selectedNote;
  NoteModel? get selectedNote => _selectedNote;

  NoteViewModel() {
    getAllNotes();
  }

  final InsertNoteUsecase _insertNoteUseCase = InsertNoteUsecase(
    noteRepository: NoteRepositoryImpl(databaseHelper: DatabaseHelper.instance),
  );

  final GetAllNoteUsecase _getAllNoteUsecase = GetAllNoteUsecase(
    noteRepository: NoteRepositoryImpl(databaseHelper: DatabaseHelper.instance),
  );

  final DeleteNoteUsecase _deleteNoteUsecase = DeleteNoteUsecase(
    noteRepository: NoteRepositoryImpl(databaseHelper: DatabaseHelper.instance),
  );

  final UpdateNoteUsecase _updateNoteUsecase = UpdateNoteUsecase(
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
    setLoading(true);
    var response = await _insertNoteUseCase.call(NoteParams(note));
    refreshNoteListOrShowError(response);
    setLoading(false);
  }

  getAllNotes() async {
    setLoading(true);
    var response = await _getAllNoteUsecase.call(NoParams());
    refreshNoteListOrShowError(response);
    setLoading(false);
  }

  updateNote(NoteModel note) async {
    setLoading(true);
    var response = await _updateNoteUsecase.call(NoteParams(note));
    refreshNoteListOrShowError(response);
    setLoading(false);
  }

  deleteNote(NoteModel note) async {
    setLoading(true);
    var response = await _deleteNoteUsecase.call(NoteParams(note));
    refreshNoteListOrShowError(response);
    setLoading(false);
  }

  refreshNoteListOrShowError(dynamic response) {
    response.fold((l) {
      setUserError(UserError(errorMessage: l.errorMessage));
    }, (r) {
      if (r is List<NoteModel>) {
        setNoteList(r);
      } else {
        getAllNotes();
      }
    });
  }

  setSelectedNoteItem(NoteModel noteModel) {
    _selectedNote = noteModel;
  }
}
