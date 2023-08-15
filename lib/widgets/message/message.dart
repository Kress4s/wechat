import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("消息"),
        title: const Text("消息"),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.add_circle_outline_rounded))
        ],
        // bottom: Tab(
        //   child: Container(
        //       width: double.infinity,
        //       child: const SizedBox(
        //         child: TextField(
        //           textAlign: TextAlign.center,
        //           decoration: InputDecoration(
        //             fillColor: Colors.white,
        //             filled: true,
        //             disabledBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(10)),
        //             ),
        //             hintText: "搜索",
        //             // icon: Icon(Icons.search),
        //           ),
        //         ),
        //       )),
        // ),
      ),
      body: const Center(
        child: Text("消息"),
      ),
    );
  }
}
