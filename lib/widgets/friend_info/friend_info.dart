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
      backgroundColor: Color.fromARGB(255, 241, 239, 239),
      appBar: AppBar(
        title: const Text("朋友圈"),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: ListTile(
                // 是否可用
                // enabled: false,
                onTap: () => print("朋友圈"),
                // selectedColor: const Color.fromARGB(255, 241, 239, 239),
                // selectedColor: Colors.red,
                // selected: true,
                title: const Text("朋友圈"),
                leading: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("./images/pengyouquan.png"),
                )),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: ListTile(
                onTap: () => print("视频号"),
                title: const Text("视频号"),
                leading: Container(
                  color: Colors.white,
                  width: 30,
                  height: 30,
                  child: Image.asset("./images/weixinshipinhao.png"),
                )),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
                onTap: () => print("直播"),
                title: const Text("直播"),
                leading: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("./images/zhibo.png"),
                )),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: ListTile(
                onTap: () => print("搜一搜"),
                title: const Text("搜一搜"),
                leading: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("./images/souyisou.png"),
                )),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: ListTile(
                onTap: () => print("附近"),
                title: const Text("附近"),
                leading: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("./images/fujin.png"),
                )),
          )
        ],
      ),
    );
  }
}
