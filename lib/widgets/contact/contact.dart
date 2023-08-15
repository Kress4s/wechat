import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("联系人"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add))
        ],
      ),
      body: const Center(
        child: Text("联系人"),
      ),
    );
  }
}
