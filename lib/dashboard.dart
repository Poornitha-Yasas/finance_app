import 'package:finance_app/centers.dart';
import 'package:finance_app/members.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/payment.dart';
import 'package:finance_app/print_page.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Menu"),
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
                      const CentersPage()), //Navigate to Centers page
                );
              },
              child: const Icon(
                Icons.attach_money_sharp,
                size: 36,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Centers',
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
                      const MembersPage(enteredValues: [],)), //Navigate to Centers page
                );
              },
              child: const Icon(
                Icons.attach_money_sharp,
                size: 36,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Members',
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
                      const PaymentsPage()), //Navigate to Centers page
                );
              },
              child: const Icon(
                Icons.attach_money_sharp,
                size: 36,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Payment',
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
                      const PrintPage()), //Navigate to Centers page
                );
              },
              child: const Icon(
                Icons.attach_money_sharp,
                size: 36,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Print',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          // Add more ListTiles as needed
        ],
      ),
    );
  }
}
