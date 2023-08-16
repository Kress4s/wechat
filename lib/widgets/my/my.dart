import 'package:flutter/material.dart';

class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
      ),
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      body: const Center(
        child: Text("我的"),
      ),
    );
  }
}
