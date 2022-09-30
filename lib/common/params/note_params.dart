import 'package:equatable/equatable.dart';
import 'package:notes_app_clean_arch_flutter/domain/model/note_model.dart';

class NoteParams extends Equatable {
  final NoteModel note;
  const NoteParams(this.note);
  @override
  List<Object?> get props => [note];
}
