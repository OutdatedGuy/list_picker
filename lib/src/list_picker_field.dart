// Flutter Packages
import 'package:flutter/material.dart';

// Themes
import '../helpers/my_border_theme.dart';

// Widgets
import 'list_picker_dialog.dart';

/// The [ListPickerField] is a [TextField] that opens a [ListPickerDialog] when tapped.
///
/// The [ListPickerField] can be used to select a value from a provided list.
class ListPickerField extends StatelessWidget {
  /// Label for the field.
  final String label;

  /// Items to be displayed in the picker dialog.
  final List<String> items;

  /// The initial value of the field.
  final String? initialValue;

  /// If true, '*' will be displayed after [label].
  ///
  /// Defaults to false
  final bool isRequired;

  /// If true, a dropdown arrow will be displayed at the end of the field.
  ///
  /// Defaults to true.
  final bool showDropdownIcon;

  ListPickerField({
    Key? key,
    required this.label,
    required this.items,
    this.initialValue,
    this.isRequired = false,
    this.showDropdownIcon = true,
  }) : super(key: key);

  late final _controller = TextEditingController(
    text: initialValue,
  );

  /// The selected value of the field.
  String get value => _controller.text;

  /// To check if field is empty.
  bool get empty => _controller.text.isEmpty;
  
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final errorColor = Theme.of(context).errorColor;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextField(
        readOnly: true,
        controller: _controller,
        onTap: () async {
          String? selectedValue = await showDialog(
            context: context,
            builder: (context) => ListPickerDialog(
              label: label,
              items: items,
            ),
          );

          if (selectedValue != null) {
            _controller.text = selectedValue;
          }
        },
        cursorColor: textColor,
        decoration: InputDecoration(
          labelText: label + (isRequired ? "*" : ""),
          labelStyle: Theme.of(context).textTheme.labelLarge,
          suffixIcon: showDropdownIcon
              ? Icon(Icons.arrow_drop_down, color: textColor)
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: myBorderTheme(textColor, 2.0),
          enabledBorder: myBorderTheme(textColor, 1.0),
          errorBorder: myBorderTheme(errorColor, 1.0),
          focusedErrorBorder: myBorderTheme(errorColor, 2.0),
        ),
      ),
    );
  }
}
