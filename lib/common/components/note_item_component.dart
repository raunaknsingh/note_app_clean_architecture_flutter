import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch_flutter/common/constants/size_constants.dart';

import '../constants/string_constants.dart';
import '../constants/style_constants.dart';

@immutable
class NoteItemComponent extends StatelessWidget {
  final String _noteId;
  final String _noteTitle;
  final String _noteDescription;
  final bool _isNoteEdited;

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
      margin: const EdgeInsets.all(dp_8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(dp_8),
          ),
          color: Colors.blueGrey),
      child: Padding(
        padding: const EdgeInsets.all(dp_8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _noteId,
                    style:
                        const TextStyle(color: Colors.white, fontSize: font_18),
                  ),
                ),
                Visibility(
                  visible: _isNoteEdited,
                  child: Container(
                    padding: const EdgeInsets.all(dp_4),
                    color: Colors.purple,
                    child: Text(
                      edited,
                      style: textStyleWhite14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: dp_8,
            ),
            Text(
              _noteTitle,
              style: textStyleWhite22,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: dp_8,
            ),
            Text(
              _noteDescription,
              style: textStyleWhite18,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
