import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/params/note_params.dart';

import '../../common/error/failure.dart';
import '../../common/usecase/usecase.dart';
import '../repository/note_repository.dart';

class InsertNoteUseCase extends UseCase<int, NoteParams> {
  final NoteRepository _noteRepository;

  InsertNoteUseCase({required NoteRepository noteRepository})
      : _noteRepository = noteRepository;

  @override
  Future<Either<Failure, int>> call(NoteParams params) async {
    return await _noteRepository.insertNote(params.note);
  }
}
