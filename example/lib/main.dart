// Flutter Packages
import 'package:flutter/material.dart';

// My Packages
import 'package:list_picker/list_picker.dart';

// List Data
import 'data/animals_list.dart';
import 'data/fruits_list.dart';
import 'data/sports_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'List Picker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController fieldCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Using the ListPickerField widget
            ListPickerField(
              label: 'Fruit',
              items: fruits,
              controller: fieldCont,
            ),
            const SizedBox(height: 16),

            // Using ListPickerDialog for custom dialog builder
            TextButton(
              onPressed: () async {
                final String? sport = await showDialog(
                  context: context,
                  builder: (BuildContext context) => Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      title: const Text('List Picker Dialog'),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(18),
                        ),
                      ),
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    body: const ListPickerDialog(
                      label: 'Sport',
                      items: sports,
                    ),
                  ),
                );

                if (sport != null && mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(sport),
                    ),
                  );
                }
              },
              child: const Text('Custom Dialog Builder'),
            ),
            const SizedBox(height: 16),

            // Using showPickerDialog for custom widget
            ElevatedButton(
              onPressed: () async {
                final String? animal = await showPickerDialog(
                  context: context,
                  label: 'Animal',
                  items: animals,
                );

                if (animal != null && mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(animal),
                    ),
                  );
                }
              },
              child: const Text('Calling showPickerDialog()'),
            ),
          ],
        ),
      ),
    );
  }
}
