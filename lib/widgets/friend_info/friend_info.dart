import 'package:flutter/material.dart';

class FriendInfo extends StatefulWidget {
  const FriendInfo({super.key});

  @override
  State<FriendInfo> createState() => _FriendInfoState();
}

class _FriendInfoState extends State<FriendInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("朋友圈"),
      ),
      body: const Center(
        child: Text("朋友圈"),
      ),
    );
  }
}
