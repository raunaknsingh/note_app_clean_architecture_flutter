import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/domain/model/NoteModel.dart';

import '../../common/error/Failure.dart';

abstract class NoteRepository {
  Future<Either<Failure, int>> insertNote(NoteModel? note);
  Future<Either<Failure, List<NoteModel>>> getAllNotes();
  Future<Either<Failure, int>> updateNote(NoteModel note);
  Future<Either<Failure, int>> deleteNote(int id);
}
