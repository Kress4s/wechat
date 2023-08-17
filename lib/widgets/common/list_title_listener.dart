import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ListTitleListener extends StatefulWidget {
  final String title;
  final String url;
  final bool enable;
  const ListTitleListener(
      {super.key, required this.title, required this.url, this.enable = true});

  @override
  State<ListTitleListener> createState() => _ListTitleListenerState();
}

class _ListTitleListenerState extends State<ListTitleListener> {
  final RxBool _flag = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        color: _flag.value ? Color.fromARGB(255, 241, 239, 239) : Colors.white,
        // decoration: const BoxDecoration(
        //     color:
        //         _flag.value ? Color.fromARGB(255, 241, 239, 239) : Colors.white,
        //     border: Border.symmetric(horizontal: BorderSide(width: 0.05))),
        child: Listener(
          onPointerDown: (detail) {
            // print("用户手指按下：${s.globalPosition}");
            _flag.value = !_flag.value;
          },
          onPointerUp: (detail) => _flag.value = !_flag.value,
          child: ListTile(
              // 是否可用
              enabled: widget.enable,
              title: Text(widget.title),
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(widget.url),
              )),
        )));
  }
}
