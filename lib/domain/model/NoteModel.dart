import 'package:notes_app_clean_arch_flutter/data/model/NoteEntity.dart';

class NoteModel {
  final String? id;
  final String? title;
  final String? description;
  final bool isEdited;
  final String? createdDate;

  NoteModel(
      {required this.id,
      required this.title,
      this.description,
      required this.isEdited,
      this.createdDate});

  static NoteModel fromNoteEntity(NoteEntity noteEntity) => NoteModel(
      id: noteEntity.id,
      title: noteEntity.title,
      description: noteEntity.description,
      isEdited: noteEntity.isEdited,
      createdDate: noteEntity.createdDate);

  NoteEntity toNoteEntity(NoteModel noteModel) => NoteEntity(
      id: noteModel.id,
      title: noteModel.title,
      description: noteModel.description,
      isEdited: noteModel.isEdited,
      createdDate: noteModel.createdDate);
}
