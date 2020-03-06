

import 'package:flutter/services.dart';

/// Format incoming numeric text to fit the format of (###) ###-#### ##...
///
/// For Login and Sign up screens, can use text.replaceAll(RegExp('[^\\d]'), '')
/// in your controller to convert strip number of '()-_' signs
class NumberInputFormatter extends TextInputFormatter {


  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue
      ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1)
        selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3)
        selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6)
        selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10)
        selectionIndex++;
    }


    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));

    if (newTextLength == 1){
      newText.write(newValue.text.substring(1) + '__) ___-____');
    }
    if (newTextLength == 2){
      newText.write(newValue.text.substring(2) + '_) ___-____');
    }
    if (newTextLength == 3){
      newText.write(newValue.text.substring(3) + ') ___-____');
    }
    if (newTextLength == 4){
      newText.write(newValue.text.substring(4) + '__-____');
    }
    if (newTextLength == 5){
      newText.write(newValue.text.substring(5) + '_-____');
    }
    if (newTextLength == 6){
      newText.write(newValue.text.substring(6) + '-____');
    }
    if (newTextLength == 7){
      newText.write(newValue.text.substring(7) + '___');
    }
    if (newTextLength == 8){
      newText.write(newValue.text.substring(8) + '__');
    }
    if (newTextLength == 9){
      newText.write(newValue.text.substring(9) + '_');
    }


    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}