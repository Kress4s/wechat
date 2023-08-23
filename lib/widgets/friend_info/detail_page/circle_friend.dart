import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wechat/database/circle_friend/circle.dart';
import 'package:wechat/tools/time_parse.dart';

// 朋友圈页面
class CircleFriend extends StatefulWidget {
  const CircleFriend({super.key});

  @override
  State<CircleFriend> createState() => _CircleFriendState();
}

class _CircleFriendState extends State<CircleFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        // 下划线
        itemCount: circleFriendInfo.length + 1,
        itemBuilder: _getCircleFriendsInfo,
        separatorBuilder: (context, index) => const Divider(
          height: 0.2,
          indent: 30,
        ),
      ),
    );
  }
}

// 获取总的朋友圈的内容
Widget _getCircleFriendsInfo(BuildContext context, int index) {
  if (index == 0) {
    // return PublishedInfo(content: circleFriendInfo[index]);
    return const Cover();
  }
  index--;
  return PublishedInfo(
    content: circleFriendInfo[index],
    // index: index,
  );
}

Widget _getImage(List<String> images) {
  // if (images.length == 1) {
  int crossAxisCount = 1;

  if (images.length == 2) {
    crossAxisCount = 2;
  } else {
    crossAxisCount = 3;
  }
  return Expanded(
      child: GridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          padding: const EdgeInsets.all(4.0),
          children: images
              .map((value) => SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.network(
                      images[0],
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList()));
}

// 朋友发布的内容
class PublishedInfo extends StatefulWidget {
  final Map content;
  // final int index;
  const PublishedInfo({
    super.key,
    required this.content,
    // required this.index
  });

  @override
  State<PublishedInfo> createState() => _PublishedInfoState();
}

class _PublishedInfoState extends State<PublishedInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                height: 50,
                // Expanded 的child的width是无效的，特定的样式需要设定padding，来矫正，
                // 这里头像是通过左右的padding来实现正方形的头像
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(widget.content["avatar"],
                      fit: BoxFit.cover),
                )),
          ),
          Expanded(
              flex: 7,
              child: Container(
                // color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.content["name"],
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 68, 161, 237)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.content["content"]),
                    _getImage(widget.content["image"]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        circleFriendsTimeAtParse(widget.content["create_at"]),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

// 朋友圈封面
class Cover extends StatelessWidget {
  const Cover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        width: double.infinity,
        // color: Colors.white,
        child: Stack(
          children: [
            // 朋友圈背景
            SizedBox(
              width: double.infinity,
              height: 240,
              child: Image.network(
                "https://inews.gtimg.com/newsapp_bt/0/10212098539/1000",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                )),
            // 发布朋友圈按钮
            Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.linked_camera_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("发布朋友圈");
                  },
                )),
            Positioned(
                right: 10,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "AmZz",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              "https://inews.gtimg.com/newsapp_bt/0/14748808874/1000",
                              fit: BoxFit.cover),
                        ))
                  ],
                ))
          ],
        ));
  }
}
