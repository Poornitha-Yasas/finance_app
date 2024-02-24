import 'package:finance_app/display.dart';
import 'package:flutter/material.dart';
import 'multivalue.dart';

class CentersPage extends StatefulWidget {
  const CentersPage({super.key});

  @override
  State<CentersPage> createState() => _CentersPageState();
}

class _CentersPageState extends State<CentersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Centers"),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10),
          ListTile(
            leading: RawMaterialButton(
              fillColor: Colors.green,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const DisplayPage()), //Navigate to Centers page
                );
              },
              child: const Icon(
                Icons.business_center,
                size: 36,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Piliyandala',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: RawMaterialButton(
              fillColor: Colors.green,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const multivaluePage()), //Navigate to Centers page
                );
              },
              child: const Icon(
                Icons.business_center,
                size: 36,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Malabe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: RawMaterialButton(
              fillColor: Colors.green,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              onPressed: () {
              },
              child: const Icon(
                Icons.business_center,
                size: 36,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Kaduwela',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
