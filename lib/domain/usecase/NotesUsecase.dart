import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/params/note_params.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/NoteRepository.dart';

import '../../common/error/failure.dart';
import '../../common/usecase/usecase.dart';

class NotesUsecase extends Usecase<int, NoteParams> {
  final NoteRepository noteRepository;

  NotesUsecase({required this.noteRepository});

  @override
  Future<Either<Failure, int>> call(NoteParams noteParams) async {
    return await noteRepository.insertNote(noteParams.note);
  }
}
