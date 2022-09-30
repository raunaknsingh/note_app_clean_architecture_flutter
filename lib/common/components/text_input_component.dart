import 'package:flutter/material.dart';

class TextInputComponent extends StatelessWidget {
  final Function onInputSaved;
  final TextInputType? _textInputType;
  final String _inputTitle;
  final String _inputError;
  String? _noteData;
  final bool? _isEnabled;
  TextInputComponent({
    Key? key,
    required this.onInputSaved,
    required String inputTitle,
    required String inputError,
    TextInputType? textInputType,
    String? noteData,
    bool? isEnabled,
  })  : _inputTitle = inputTitle,
        _inputError = inputError,
        _textInputType = textInputType,
        _noteData = noteData,
        _isEnabled = isEnabled,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        enabled: _isEnabled,
        initialValue: _noteData,
        keyboardType: _textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: _inputTitle,
        ),
        validator: (input) {
          if ((input == null || input.isEmpty == true) &&
              (_noteData == null || _noteData?.isEmpty == true)) {
            return _inputError;
          }
          return null;
        },
        onChanged: (input) {
          _noteData = input;
          onInputSaved(input);
        },
      ),
    );
  }
}
