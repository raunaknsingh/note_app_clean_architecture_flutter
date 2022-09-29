import 'package:flutter/material.dart';

import '../constants/StringConstants.dart';

class TextInputComponent extends StatelessWidget {
  final Function onInputSaved;
  final _textInputType;
  final _inputTitle;
  final _inputDescription;
  TextInputComponent(
      {required this.onInputSaved,
      required String inputTitle,
      required String inputDescription,
      TextInputType? textInputType})
      : _inputTitle = inputTitle,
        _inputDescription = inputDescription,
        _textInputType = textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: _textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: _inputTitle,
        ),
        validator: (input) {
          if (input == null || input.isEmpty) {
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
