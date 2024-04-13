import 'package:flutter/material.dart';

class People extends StatelessWidget {
  const People({super.key});

  @override
  Widget build(BuildContext context) {
    openPeople() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: openPeople, child: const Text('Go Back'))),
    );
  }
}
