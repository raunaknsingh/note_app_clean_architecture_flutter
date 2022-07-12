import 'package:notes_app_clean_arch_flutter/data/database/DatabaseHelper.dart';
import 'package:notes_app_clean_arch_flutter/data/model/NoteEntity.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/NoteRepository.dart';

class NoteRepositoryImpl implements NoteRepository {
  DatabaseHelper databaseHelper;
  NoteRepositoryImpl({required this.databaseHelper});

  @override
  Future<int> deleteNote(int id) async {
    return databaseHelper.deleteNote(id);
  }

  @override
  Future<List<NoteEntity>> getAllNotes() async {
    return await databaseHelper.readAllNotes();
  }

  @override
  Future<int> insertNote(NoteEntity note) async {
    return await databaseHelper.insertNote(note);
  }

  @override
  Future<int> updateNote(NoteEntity note) async {
    return await databaseHelper.updateNote(note);
  }
}
