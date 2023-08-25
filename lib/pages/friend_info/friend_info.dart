import 'package:flutter/material.dart';
import '../common/list_title_listener.dart';

// 底部导航 朋友圈
class FriendInfo extends StatefulWidget {
  const FriendInfo({super.key});

  @override
  State<FriendInfo> createState() => _FriendInfoState();
}

class _FriendInfoState extends State<FriendInfo> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 239, 239),
      appBar: AppBar(
        title: const Text("发现"),
      ),
      body: ListView(
        children: const [
          ListTitleListener(title: "朋友圈", url: "./images/pengyouquan.png"),
          SizedBox(height: 10),
          ListTitleListener(title: "视频号", url: "./images/weixinshipinhao.png"),
          ListTitleListener(title: "直播", url: "./images/zhibo.png"),
          SizedBox(height: 10),
          ListTitleListener(title: "搜一搜", url: "./images/souyisou.png"),
          SizedBox(height: 10),
          ListTitleListener(title: "附近", url: "./images/fujin.png"),
        ],
      ),
    );
  }
}
