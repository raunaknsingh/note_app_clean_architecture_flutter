import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/params/note_params.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/note_repository.dart';

import '../../common/error/failure.dart';
import '../../common/usecase/usecase.dart';

class DeleteNoteUseCase extends UseCase<int, NoteParams> {
  final NoteRepository _noteRepository;

  DeleteNoteUseCase({required NoteRepository noteRepository})
      : _noteRepository = noteRepository;

  @override
  Future<Either<Failure, int>> call(NoteParams params) async {
    return await _noteRepository.deleteNote(params.note.id);
  }
}
