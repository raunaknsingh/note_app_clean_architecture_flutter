import 'package:equatable/equatable.dart';

import '../../data/model/NoteEntity.dart';

class NoteParams extends Equatable {
  NoteEntity note;
  NoteParams(this.note);
  @override
  List<Object?> get props => [note];
}
