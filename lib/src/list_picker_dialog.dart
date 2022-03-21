// Flutter Packages
import 'package:flutter/material.dart';

// Themes
import '../helpers/my_border_theme.dart';

/// A dialog that displays a list of items and lets the user select one.
///
/// The selected value is returned as [Future] using [Navigator.pop].
///
/// Must be used within [showDialog].
class ListPickerDialog extends StatefulWidget {
  /// Label for title and search bar.
  final String label;

  /// Items to be displayed as [ListView] in the dialog.
  final List<String> items;

  const ListPickerDialog({
    Key? key,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  State<ListPickerDialog> createState() => _ListPickerDialogState();
}

class _ListPickerDialogState extends State<ListPickerDialog> {
  late List<String> searchList = widget.items;

  void _onSearchChanged(String value) {
    value = value.toLowerCase().trim();
    setState(() {
      searchList = widget.items
          .where((item) => item.toLowerCase().contains(value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text('Select ${widget.label}'),
      content: SizedBox(
        height: 450.0,
        width: 320.0,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Select ${widget.label}',
                hintStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: myBorderTheme(textColor, 2.0),
                enabledBorder: myBorderTheme(textColor, 1.0),
              ),
              cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchChanged,
            ),
            const Divider(),
            SizedBox(
              height: 350.0,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                children: searchList.map((item) {
                  return ListTile(
                    title: Text(item),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 0.0,
                    ),
                    onTap: () => Navigator.of(context).pop(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
