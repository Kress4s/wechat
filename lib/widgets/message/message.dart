import 'package:flutter/material.dart';
import "../../database/message/messages.dart";
import '../tools/keepAliveWrapper.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

// List<Widget> _getMessageList() {
//   var list = messages.map((ele) {
//     return ListTile(
//       leading: Image.network(ele["avatar"]),
//       title: Text(ele["name"]),
//       subtitle: Text(ele["content"]),
//       // 聊天内容样式
//       subtitleTextStyle: const TextStyle(
//         // 文本溢出，省略号代替
//         overflow: TextOverflow.ellipsis,
//       ),
//       trailing: Text(ele["time_at"]),
//     );
//   });
//   // list.toList().insert(0, Container());
//   return list.toList();
// }

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text("消息"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline_rounded))
          ],
        ),
        // body: ListView(
        //   children: _getMessageList(),
        // )
        body: KeepAliveWrapper(
          KeepAlive: true,
          child: ListView.builder(
            itemBuilder: _getMessageList,
            itemCount: messages.length + 1,
          ),
        ));
    // body: ListView.builder(itemBuilder: itemBuilder),
  }
}

class MessageSearch extends StatelessWidget {
  const MessageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        height: 35,
        padding: const EdgeInsets.all(5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  size: 15,
                  color: Colors.grey,
                ),
                Text(
                  "搜索",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _getMessageList(BuildContext context, int index) {
  if (index == 0) {
    return const MessageSearch();
  }
  index--;
  return Message(index: index);
}

class Message extends StatefulWidget {
  final int index;
  const Message({super.key, required this.index});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool _flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // : Colors.white,
      decoration: BoxDecoration(
          color:
              _flag ? const Color.fromARGB(255, 241, 239, 239) : Colors.white,
          // 只设置下边框有线
          border: const Border.symmetric(
              horizontal: BorderSide(width: 0.1, color: Colors.grey))),
      child: Listener(
        onPointerDown: (detail) {
          setState(() {
            _flag = !_flag;
          });
        },
        onPointerUp: (detail) {
          setState(() {
            _flag = !_flag;
          });
        },
        child: ListTile(
          key: ValueKey(messages[widget.index]["id"]),
          leading: Image.network(messages[widget.index]["avatar"]),
          title: Text(messages[widget.index]["name"]),
          subtitle: Text(messages[widget.index]["content"]),
          // 聊天内容样式
          subtitleTextStyle: const TextStyle(
            // 文本溢出，省略号代替
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(messages[widget.index]["time_at"]),
          // onTap: () => ,
        ),
      ),
    );
  }
}
