import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/params/NoteParams.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/NoteRepository.dart';

import '../../common/error/Failure.dart';
import '../../common/usecase/Usecase.dart';

class InsertNoteUsecase extends Usecase<int, NoteParams> {
  final NoteRepository noteRepository;

  InsertNoteUsecase({required this.noteRepository});

  @override
  Future<Either<Failure, int>> call(NoteParams noteParams) async {
    return await noteRepository.insertNote(noteParams.note);
  }
}
