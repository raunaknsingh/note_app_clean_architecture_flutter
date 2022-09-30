import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/error/failure.dart';
import 'package:notes_app_clean_arch_flutter/data/database/database_helper.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/note_repository.dart';

import '../../common/constants/string_constants.dart';
import '../../domain/model/note_model.dart';

class NoteRepositoryImpl implements NoteRepository {
  DatabaseHelper databaseHelper;
  NoteRepositoryImpl({required this.databaseHelper});

  @override
  Future<Either<Failure, int>> deleteNote(int id) async {
    try {
      final result = await databaseHelper.deleteNote(id);
      return Right(result);
    } catch (e) {
      return const Left(Failure(errorMessage: deleteNoteError));
    }
  }

  @override
  Future<Either<Failure, List<NoteModel>>> getAllNotes() async {
    try {
      final result = await databaseHelper.readAllNotes();
      return Right(result
          .map((noteEntity) => NoteModel.fromNoteEntity(noteEntity))
          .toList());
    } catch (e) {
      return const Left(Failure(errorMessage: readAllNoteError));
    }
  }

  @override
  Future<Either<Failure, int>> insertNote(NoteModel? note) async {
    try {
      if (note == null) {
        return const Left(Failure(errorMessage: noteNullError));
      }
      final result = await databaseHelper.insertNote(note.toNoteEntity(note));
      return Right(result);
    } catch (e) {
      return const Left(Failure(errorMessage: insertNoteError));
    }
  }

  @override
  Future<Either<Failure, int>> updateNote(NoteModel note) async {
    try {
      final result = await databaseHelper.updateNote(note.toNoteEntity(note));
      return Right(result);
    } catch (e) {
      return const Left(Failure(errorMessage: updateNoteError));
    }
  }
}
