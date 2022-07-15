import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/constants/error_constants.dart';
import 'package:notes_app_clean_arch_flutter/common/error/failure.dart';
import 'package:notes_app_clean_arch_flutter/data/database/DatabaseHelper.dart';
import 'package:notes_app_clean_arch_flutter/data/model/NoteEntity.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/NoteRepository.dart';

class NoteRepositoryImpl implements NoteRepository {
  DatabaseHelper databaseHelper;
  NoteRepositoryImpl({required this.databaseHelper});

  @override
  Future<Either<Failure, int>> deleteNote(int id) async {
    try {
      final result = await databaseHelper.deleteNote(id);
      return Right(result);
    } catch (e) {
      return const Left(Cachefailure(errorMessage: ErrorConstants.deleteNote));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getAllNotes() async {
    try {
      final result = await databaseHelper.readAllNotes();
      return Right(result);
    } catch (e) {
      return const Left(Cachefailure(errorMessage: ErrorConstants.readAllNote));
    }
  }

  @override
  Future<Either<Failure, int>> insertNote(NoteEntity note) async {
    try {
      final result = await databaseHelper.insertNote(note);
      return Right(result);
    } catch (e) {
      return const Left(Cachefailure(errorMessage: ErrorConstants.insertNote));
    }
  }

  @override
  Future<Either<Failure, int>> updateNote(NoteEntity note) async {
    try {
      final result = await databaseHelper.updateNote(note);
      return Right(result);
    } catch (e) {
      return const Left(Cachefailure(errorMessage: ErrorConstants.updateNote));
    }
  }
}
