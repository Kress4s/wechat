import 'package:flutter/material.dart';
import "./widgets/contact/contact.dart";
import "./widgets/my/my.dart";
import './widgets/friend_info/friend_info.dart';
import './widgets/message/message.dart';
import './out_icon/table_icon.dart';

class Table extends StatefulWidget {
  const Table({super.key});

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  List<Widget> tables = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tables = [
      const Messages(),
      const Contact(),
      const FriendInfo(),
      const My()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tables[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 5.0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                OutIcon.message,
              ),
              label: "消息"),
          BottomNavigationBarItem(icon: Icon(OutIcon.contact), label: "联系人"),
          BottomNavigationBarItem(icon: Icon(OutIcon.find), label: "发现"),
          BottomNavigationBarItem(icon: Icon(OutIcon.my), label: "我的"),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        fixedColor: Colors.green,
      ),
    );
  }
}
