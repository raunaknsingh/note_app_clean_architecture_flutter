import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/params/NoteParams.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/NoteRepository.dart';

import '../../common/error/Failure.dart';
import '../../common/usecase/Usecase.dart';

class DeleteNoteUsecase extends Usecase<int, NoteParams> {
  final NoteRepository _noteRepository;

  DeleteNoteUsecase({required NoteRepository noteRepository})
      : _noteRepository = noteRepository;

  @override
  Future<Either<Failure, int>> call(NoteParams params) async {
    return await _noteRepository.deleteNote(params.note.id);
  }
}
