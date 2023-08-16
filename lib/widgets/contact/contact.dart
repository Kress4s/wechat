import 'package:flutter/material.dart';
import '../../out_icon/contact.dart';
import '../../database/contact/contact.dart';

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
          separatorBuilder: (context, index) => const Divider(height: 0.05),
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
  return Container(
    padding: const EdgeInsets.all(5),
    color: Colors.white,
    child: ListTile(
        title: Text(contacts[index]["name"]),
        // 实现圆角: Container、CircleAvatar、ClipOval、ClipRRect组件
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            contacts[index]["avatar"],
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
  );
}

// 联系人header的服务信息组件
class ContactHeadList extends StatelessWidget {
  final String title;
  final String url;
  const ContactHeadList({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      // 下划线分割使用 ListView.separated实现了
      // decoration: const BoxDecoration(
      //     border: Border.symmetric(
      //         horizontal: BorderSide(width: 0.05, color: Colors.grey))),
      child: ListTile(
        title: Text(title),
        leading: ImagesCustomerIcon(
          true,
          radius: 10,
          Url: url,
        ),
      ),
    );
  }
}
