import 'package:flutter/material.dart';
import '../common/list_title_listener.dart';

class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
      ),
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      body: ListView(
        children: [
          // UserAccountsDrawerHeader(
          //   decoration: const BoxDecoration(
          //       // color: Colors.white,
          //       ),
          //   currentAccountPicture: const CircleAvatar(
          //     child: Image(
          //         image: NetworkImage(
          //             "https://inews.gtimg.com/newsapp_bt/0/14748808874/1000")),
          //   ),
          //   accountEmail: const Text(
          //     "微信号: X1208209000",
          //     // style: TextStyle(color: Colors.black),
          //   ),
          //   accountName: const Text(
          //     "AmZz",
          //     // style: TextStyle(color: Colors.black)
          //   ),
          //   onDetailsPressed: () {
          //     print("详情");
          //   },
          // ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              "https://inews.gtimg.com/newsapp_bt/0/14748808874/1000",
                              // "https://img1.baidu.com/it/u=3532230197,1265680337&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                              // "https://up.enterdesk.com/edpic/c5/53/fc/c553fc991edef5ecbc674c9e24ddd4f0.jpg",
                              fit: BoxFit.cover),
                        )),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AmZz",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "微信号: X1208209000",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Positioned(
                            left: 2,
                            bottom: 13,
                            child: Row(
                              children: [
                                SizedBox(
                                  // padding: EdgeInsets.zero,
                                  width: 60,
                                  height: 25,
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        // 去掉button里面的padding，阻碍文字伸展
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.zero)),
                                    onPressed: () {},
                                    child: const Text(
                                      "+ 状态",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  // padding: EdgeInsets.zero,
                                  width: 25,
                                  height: 25,
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.5))),
                                        // 去掉button里面的padding，阻碍文字伸展
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.zero)),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: IconButton(
                                padding: const EdgeInsets.all(5),
                                tooltip: "个人二维码",
                                iconSize: 20,
                                onPressed: () {},
                                icon: const Icon(Icons.qr_code_outlined)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                              width: 30,
                              height: 30,
                              // 没有点击效果增加Material包裹button
                              child: Material(
                                child: IconButton(
                                    padding: const EdgeInsets.all(5),
                                    // color: Colors.red,
                                    iconSize: 20,
                                    tooltip: "个人信息",
                                    onPressed: () {
                                      print("个人信息");
                                    },
                                    splashColor: Colors.red,
                                    icon: const Icon(Icons.arrow_forward_ios)),
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const ListTitleListener(title: "服务", url: "./images/weixinzhifu.png"),
          const SizedBox(height: 10),
          const ListTitleListener(title: "收藏", url: "./images/shoucang.png"),
          const ListTitleListener(
              title: "朋友圈", url: "./images/pengyouquan.png"),
          const ListTitleListener(
              title: "视频号", url: "./images/weixinshipinhao.png"),
          const ListTitleListener(
              title: "卡包", url: "./images/weixinqiabao.png"),
          const ListTitleListener(title: "表情", url: "./images/biaoqing.png"),
          const SizedBox(height: 10),
          const ListTitleListener(title: "设置", url: "./images/shezhi.png"),
        ],
      ),
    );
  }
}
