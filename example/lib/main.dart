// Flutter Packages
import 'package:flutter/material.dart';

// My Packages
import 'package:list_picker/list_picker.dart';

// List Data
import 'data/fruits_list.dart';
import 'data/animals_list.dart';

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fieldCont = TextEditingController();
  final btnCont = TextEditingController();

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
          children: [
            ListPickerField(
              label: "Fruit",
              items: fruits,
              controller: fieldCont,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String? animal = await showPickerDialog(
                  context: context,
                  label: "Animal",
                  items: animals,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(animal ?? "No animal selected"),
                  ),
                );
              },
              child: const Text("Select Your Favourite animal"),
            ),
          ],
        ),
      ),
    );
  }
}
