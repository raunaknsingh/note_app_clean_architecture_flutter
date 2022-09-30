import 'package:flutter/material.dart';

@immutable
class TextInputComponent extends StatelessWidget {
  final Function onInputSaved;
  final TextInputType? _textInputType;
  final String _inputTitle;
  final String _inputDescription;
  final String? _noteData;
  final bool? _isEnabled;
  const TextInputComponent(
      {Key? key,
      required this.onInputSaved,
      required String inputTitle,
      required String inputDescription,
      TextInputType? textInputType,
      String? noteData,
      bool? isEnabled})
      : _inputTitle = inputTitle,
        _inputDescription = inputDescription,
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
