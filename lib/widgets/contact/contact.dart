import 'package:flutter/material.dart';
import '../../out_icon/contact.dart';
import '../../database/contact/contact.dart';
// import 'package:wechat/widgets/common/list_title_listener.dart';
// import 'package:get/get.dart';

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
        backgroundColor: Colors.white,
        body: SizedBox(
            // separated可以设置下划线， build需要自己设置每个ListTitle的下划线
            child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: _getContactList,
          itemCount: contacts.length + 5,
          // 下划线
          separatorBuilder: (context, index) => const Divider(
            height: 0.1,
            indent: 30,
          ),
        )));
  }
}

Widget _getContactList(BuildContext context, int index) {
  switch (index) {
    case 0:
      return const ContactHeadList(
        title: "新的朋友",
        url: "./images/xindepengyou.png",
      );
    case 1:
      return const ContactHeadList(
        title: "群聊",
        url: "./images/qunliao.png",
      );
    case 2:
      return const ContactHeadList(title: "标签", url: "./images/biaoqian.png");
    case 3:
      return const ContactHeadList(
        title: "公众号",
        url: "./images/gongzhonghao.png",
      );
    case 4:
      return const ContactHeadList(
        title: "企业微信联系人",
        url: "./images/qiyeweixin.png",
      );
    case 5:
      return Container(
        height: 4,
        color: const Color.fromARGB(255, 241, 238, 238),
      );
    default:
      break;
  }
  if (index >= 6) {
    index -= 6;
  }
  return Contacts(index: index);
}

// 联系人header的服务信息组件
class ContactHeadList extends StatefulWidget {
  final String title;
  final String url;
  const ContactHeadList({super.key, required this.title, required this.url});

  @override
  State<ContactHeadList> createState() => _ContactHeadListState();
}

class _ContactHeadListState extends State<ContactHeadList> {
  bool _flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: _flag ? Color.fromARGB(255, 241, 239, 239) : Colors.white,
      // 下划线分割使用 ListView.separated实现了
      // decoration: const BoxDecoration(
      //     border: Border.symmetric(
      //         horizontal: BorderSide(width: 0.05, color: Colors.grey))),
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
          title: Text(widget.title),
          leading: ImagesCustomerIcon(
            true,
            radius: 10,
            Url: widget.url,
          ),
        ),
      ),
    );
  }
}

class Contacts extends StatefulWidget {
  final int index;
  const Contacts({super.key, required this.index});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  bool _flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        color: _flag ? Color.fromARGB(255, 241, 239, 239) : Colors.white,
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
              title: Text(contacts[widget.index]["name"]),
              // 实现圆角: Container、CircleAvatar、ClipOval、ClipRRect组件
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  contacts[widget.index]["avatar"],
                  fit: BoxFit.cover,
                ),
              )
              // Container的实现圆角
              // Container(
              //   clipBehavior: Clip.hardEdge, // ！！！！这个实现圆角很重要，多出的裁剪掉
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Image.network(
              //     contacts[index]["avatar"],
              //     fit: BoxFit.cover,
              //   ),
              // )
              ),
        ));
  }
}
