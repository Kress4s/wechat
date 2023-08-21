import 'package:flutter/material.dart';

PopupMenuButton popupMenuButton(BuildContext context) {
  return PopupMenuButton(
    itemBuilder: (BuildContext context) {
      return [
        const PopupMenuItem(
            value: "chat_room",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex: 2, child: Icon(Icons.message)),
                Expanded(
                  flex: 3,
                  child: Text(
                    "发起群聊",
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            )),
        const PopupMenuItem(
          value: "new_friend",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(flex: 2, child: Icon(Icons.person_add)),
              Expanded(
                flex: 3,
                child: Text(
                  "新的朋友",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: "scan",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: Icon(Icons.qr_code_scanner_sharp)),
              Expanded(
                flex: 3,
                child: Text(
                  "扫一扫",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: "new_friend",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(flex: 2, child: Icon(Icons.qr_code_2)),
              Expanded(
                flex: 3,
                child: Text(
                  "收付款",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ];
    },
    onSelected: (value) => print(value),
    onCanceled: () {
      print("canceled");
    },
    offset: const Offset(50, 50),
    // color: Colors.yellow,
    icon: const Icon(Icons.add_circle_outline_rounded),
    iconSize: 25,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
