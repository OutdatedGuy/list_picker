// Flutter Packages
import 'package:flutter/material.dart';

// Widgets
import 'list_picker_dialog.dart';

/// Opens the [ListPickerDialog] and returns the selected value.
Future<String?> showPickerDialog({
  required BuildContext context,
  required String label,
  required List<String> items,
}) {
  return showDialog(
    context: context,
    builder: (context) => ListPickerDialog(
      label: label,
      items: items,
    ),
  );
}
