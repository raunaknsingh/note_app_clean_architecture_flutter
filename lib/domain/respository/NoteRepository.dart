import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/data/model/NoteEntity.dart';

import '../../common/error/failure.dart';

abstract class NoteRepository {
  Future<Either<Failure, int>> insertNote(NoteEntity note);
  Future<Either<Failure, List<NoteEntity>>> getAllNotes();
  Future<Either<Failure, int>> updateNote(NoteEntity note);
  Future<Either<Failure, int>> deleteNote(int id);
}
