import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  final List<String> enteredValues;

  const MembersPage({Key? key, required this.enteredValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Members"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Entered Values:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (String value in enteredValues.take(3))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(value),
              ),
          ],
        ),
      ),
    );
  }
}
