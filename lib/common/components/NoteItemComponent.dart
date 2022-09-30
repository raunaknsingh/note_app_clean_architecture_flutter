import 'package:flutter/material.dart';

@immutable
class NoteItemComponent extends StatelessWidget {
  final _noteId;
  final _noteTitle;
  final _noteDescription;
  final _isNoteEdited;

  const NoteItemComponent(
      {Key? key,
      required String noteId,
      required String noteTitle,
      required String noteDescription,
      required bool isNoteEdited})
      : _noteId = noteId,
        _noteTitle = noteTitle,
        _noteDescription = noteDescription,
        _isNoteEdited = isNoteEdited,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.purple),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _noteId,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Visibility(
                  visible: _isNoteEdited,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.pink,
                    child: Text(
                      'Edited',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              _noteTitle,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              _noteDescription,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
