import 'package:flutter/material.dart';
import 'preferences.dart'; // Import the preferences file

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Field Values"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: Preferences.getStoredValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No stored data.');
            } else {
              // Use the retrieved values in your UI
              List<String> enteredValues1 = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Entered Multiple Values List:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  for (String value in enteredValues1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(value),
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
