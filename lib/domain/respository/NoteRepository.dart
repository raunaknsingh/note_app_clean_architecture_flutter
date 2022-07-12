import 'package:notes_app_clean_arch_flutter/data/model/NoteEntity.dart';

abstract class NoteRepository {
  Future<int> insertNote(NoteEntity note);
  Future<List<NoteEntity>> getAllNotes();
  Future<int> updateNote(NoteEntity note);
  Future<int> deleteNote(int id);
}
