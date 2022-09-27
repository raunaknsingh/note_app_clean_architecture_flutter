import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch_flutter/common/params/NoParams.dart';
import 'package:notes_app_clean_arch_flutter/common/params/NoteParams.dart';
import 'package:notes_app_clean_arch_flutter/domain/model/NoteModel.dart';
import 'package:notes_app_clean_arch_flutter/domain/respository/NoteRepository.dart';

import '../../common/error/Failure.dart';
import '../../common/usecase/Usecase.dart';

class GetAllNoteUsecase extends Usecase<List<NoteModel>, NoParams> {
  final NoteRepository _noteRepository;

  GetAllNoteUsecase({required NoteRepository noteRepository})
      : _noteRepository = noteRepository;

  @override
  Future<Either<Failure, List<NoteModel>>> call(NoParams noParams) async {
    return await _noteRepository.getAllNotes();
  }
}
