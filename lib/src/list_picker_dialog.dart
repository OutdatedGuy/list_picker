// Flutter Packages
import 'package:flutter/material.dart';

// Themes
import 'package:list_picker/helpers/my_border_theme.dart';

/// A dialog that displays a list of items and lets the user select one.
///
/// The selected value is returned as [Future] using [Navigator.pop].
///
/// Must be used within [showDialog].
class ListPickerDialog extends StatefulWidget {
  /// Creates a dialog widget to be used in [showDialog] method.
  ///
  /// Dialog contains a search bar and a [ListView] of items.
  ///
  /// Selected item is returned as [Future] using [Navigator.pop].
  const ListPickerDialog({
    Key? key,
    required this.label,
    required this.items,
    this.width = 320.0,
    this.height = 450.0,
  })  : _scrollableHeight = height - 100.0,
        super(key: key);

  /// Label for title and search bar.
  final String label;

  /// Items to be displayed as [ListView] in the dialog.
  final List<String> items;

  /// Width of the dialog window.
  ///
  /// Defaults to `320.0`.
  final double width;

  /// Height of the dialog window.
  ///
  /// Defaults to `450.0`.
  final double height;

  /// Scrollable height of the dialog window.
  ///
  /// Defaults to `height - 100.0`.
  final double? _scrollableHeight;

  @override
  State<ListPickerDialog> createState() => _ListPickerDialogState();
}

class _ListPickerDialogState extends State<ListPickerDialog> {
  late List<String> searchList = widget.items;

  void _onSearchChanged(String value) {
    final searchValue = value.toLowerCase().trim();
    setState(() {
      searchList = widget.items
          .where((String item) => item.toLowerCase().contains(searchValue))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Select ${widget.label}'),
      content: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Search ${widget.label}',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: myBorderTheme(textColor, 2),
                enabledBorder: myBorderTheme(textColor, 1),
              ),
              cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchChanged,
            ),
            const Divider(),
            SizedBox(
              height: widget._scrollableHeight,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: searchList.map((String item) {
                  return ListTile(
                    title: Text(item),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
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
