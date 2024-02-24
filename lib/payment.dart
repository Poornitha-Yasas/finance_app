import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'members.dart';
import 'package:http/http.dart' as http;
import 'package:finance_app/Services/Service.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  String _paymentValue = 'Dutugamunu Mawatha 1';
  String _secondDropdownValue = 'G-1';
  final TextEditingController _usernameController = TextEditingController();

  final _items = [
    'Dutugamunu Mawatha 1',
    'Dutugamunu Mawatha 2',
    'Dutugamunu Mawatha 3',
  ];
  final _secondDropdownItems = ['G-1', 'G-2', 'G-3','G-4','G-5'];

  // List of controllers for each row
  final List<TextEditingController> _rowControllers = [];

  // List to store entered values
  List<String> _enteredValues = [];

  // Key for shared preferences
  final String _enteredValuesKey = 'entered_values';

  // Track the selected row count
  int _selectedRowCount = 1;

  Future getCustomerCenters() async {
    print("invoice details");
    APIServices.selectCenter()
        .then((response) {
      if (response.statusCode == 200) {
        print("test print");
        String rep = response.body.toString();
        var invoData = json.decode(rep);


        /*for (var invd in invoData) {
          print(invd["sub_tot"]);
        }*/
      } else {
        print('Request failed with status invoice details');
      }
    });
  }
  @override
  void initState() {
    super.initState();
    getCustomerCenters();
    // Load stored values from shared preferences when the widget initializes
    _loadEnteredValues();
  }

  Future<void> _loadEnteredValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? storedValues = prefs.getStringList(_enteredValuesKey);

    if (storedValues != null) {
      setState(() {
        _enteredValues = storedValues;
      });
    }
  }

  Future<void> _saveEnteredValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_enteredValuesKey, _enteredValues);
  }

  // Function to print entered values
  final logger = Logger();

  void _printEnteredValues() {
    logger.d('Entered Values: $_enteredValues');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 80,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: DropdownButton(
                  isExpanded: true,
                  value: _paymentValue,
                  items: _items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _paymentValue = newValue!;
                    });
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 80,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: DropdownButton(
                  isExpanded: true,
                  value: _secondDropdownValue,
                  items: _secondDropdownItems.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _secondDropdownValue = newValue!;
                      _selectedRowCount = int.parse(newValue.split('-')[1]);
                    });
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: '0.00',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      onChanged: (value) {
                        // Add the entered value to the list when it changes
                        _enteredValues.add(value);
                        _saveEnteredValues(); // Save the list to shared preferences
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildTable(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _printEnteredValues(); // Print entered values
                // Navigate to MembersPage and pass the entered values
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MembersPage(enteredValues: _enteredValues),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text(
                'Print Receipt',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(),
        children: List.generate(_selectedRowCount, (index) {
          return TableRow(
            children: [
              _buildTableCell('Column 1, Row ${index + 1}'),
              _buildTableCell('Column 2, Row ${index + 1}'),
              _buildEditableTableCell(index),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildEditableTableCell(int index) {
    if (_rowControllers.length <= index) {
      _rowControllers.add(TextEditingController());
    }

    TextEditingController controller = _rowControllers[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter value',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
        onChanged: (value) {
          if (index >= 0 && index < _enteredValues.length) {
            setState(() {
              _enteredValues[index] = value;
              _saveEnteredValues();
            });
          }
        },
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}