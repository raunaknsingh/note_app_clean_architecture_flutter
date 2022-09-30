import 'package:flutter/material.dart';

import '../constants/StringConstants.dart';

@immutable
class TextInputComponent extends StatelessWidget {
  final Function onInputSaved;
  final _textInputType;
  final _inputTitle;
  final _inputDescription;
  final String? _noteData;
  TextInputComponent(
      {required this.onInputSaved,
      required String inputTitle,
      required String inputDescription,
      TextInputType? textInputType,
      String? noteData})
      : _inputTitle = inputTitle,
        _inputDescription = inputDescription,
        _textInputType = textInputType,
        _noteData = noteData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        initialValue: _noteData,
        keyboardType: _textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: _inputTitle,
        ),
        validator: (input) {
          if (input?.isEmpty == true && _noteData?.isEmpty == true) {
            return _inputDescription;
          }
        },
        onChanged: (input) {
          onInputSaved(input);
        },
      ),
    );
  }
}
