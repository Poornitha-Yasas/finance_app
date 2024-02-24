import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class multivaluePage extends StatefulWidget {
  const multivaluePage({super.key});

  @override
  State<multivaluePage> createState() => _multivaluePageState();
}

class _multivaluePageState extends State<multivaluePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  List<TextEditingController> controllers = List.generate(
    7,
        (index) => TextEditingController(),
  );
  List<String> inputValues = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Text Input Fields'),
      ),
      body: ListView.builder(
        itemCount: controllers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controllers[index],
              decoration: InputDecoration(
                labelText: 'Field ${index + 1}',
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Collect the values of all input fields
          inputValues = controllers.map((controller) => controller.text).toList();

          // Save the values to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setStringList('inputValues', inputValues);

          // Print the values in the terminal
          print('Input values: ${inputValues.join(', ')}');
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}