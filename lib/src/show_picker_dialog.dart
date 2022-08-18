// Flutter Packages
import 'package:flutter/material.dart';

// Widgets
import 'package:list_picker/src/list_picker_dialog.dart';

/// Opens the [ListPickerDialog] and returns the selected value.
///
/// `null` is returned if the dialog is closed without selecting a value.
Future<String?> showPickerDialog({
  required BuildContext context,
  required String label,
  required List<String> items,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => ListPickerDialog(
      label: label,
      items: items,
    ),
  );
}
