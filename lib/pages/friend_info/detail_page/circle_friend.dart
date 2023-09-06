import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:wechat/database/circle_friend/circle.dart';
import 'package:wechat/services/controller/circle_friend.dart';
import 'package:wechat/services/models/circle_friend.dart';
import 'package:wechat/tools/time_parse.dart';
import 'package:photo_view/photo_view_gallery.dart';

// 初始化 controller

final CircleFriendController controller = Get.put(CircleFriendController());

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
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              // 下划线
              // itemCount: circleFriendInfo.length + 1,
              itemCount: controller.infoList.length + 1,
              itemBuilder: _getCircleFriendsInfo,
              separatorBuilder: (context, index) => const Divider(
                height: 0.2,
                indent: 30,
              ),
            );
          }
        }));
  }
}

// 朋友圈总体布局内容
Widget _getCircleFriendsInfo(BuildContext context, int index) {
  if (index == 0) {
    // 第一行是封面
    return const Cover();
  }
  index--;
  // 朋友圈信息内容
  return PublishedInfo(
    content: controller.infoList[index],
    // index: index,
  );
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
                  width: 40,
                  height: 40,
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

// 朋友发布的内容
class PublishedInfo extends StatefulWidget {
  // final Map content;
  final CircleFriendInfo content;
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
                  // child: Image.network(widget.content["avatar"],
                  //     fit: BoxFit.cover),
                  // child: Image.network(widget.content["avatar"],
                  child:
                      Image.network(widget.content.avatar, fit: BoxFit.cover),
                )),
          ),
          // 朋友圈内容区
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // widget.content["name"],
                  widget.content.name,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 68, 161, 237)),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Text(widget.content["content"]),
                Text(widget.content.content),
                // _getImage(widget.content["image"]),
                _getImage(widget.content.images),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    // circleFriendsTimeAtParse(widget.content["create_at"]),
                    circleFriendsTimeAtParse(widget.content.createAt),
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 获取朋友圈发布的图片展示
Widget _getImage(List images) {
  // if (images.length == 1) {
  if (images.isEmpty) {
    // 没有图片，返回一个空的Widget,  SizedBox.shrink() 或者 Container()
    // return const SizedBox.shrink();
    return Container();
  }
  // 只要有图片，直接等于3，这样图片的展示九宫格大小相对一致，不会造成一张或者两张图片平分一行造成图片大小不一致的情况
  int crossAxisCount = 3;

  // if (images.length == 2) {
  //   crossAxisCount = 2;
  // } else {
  //   crossAxisCount = 3;
  // }
  return GridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      padding: const EdgeInsets.all(4.0),

      /// COLUMN中，生成九宫图,需要加上这个，!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      physics: const NeverScrollableScrollPhysics(), //增加  滑动类型设置
      shrinkWrap: true, //增加 内容适配
      ///
      children: images
          .map((value) => GestureDetector(
              onTap: () {
                // 拿到当前图片的索引值
                int index = images.indexOf(value);
                Get.to(FriendPhotoViews(index: index, images: images),
                    // 点击打开图片的动画
                    transition: Transition.fadeIn);
              },
              child: SizedBox(
                // height: 100,
                // width: 100,
                child: Image.network(
                  value,
                  fit: BoxFit.cover,
                ),
              )))
          .toList());
}

// 预览图片
// ignore: must_be_immutable
class FriendPhotoViews extends StatefulWidget {
  final List images;
  late int index;
  FriendPhotoViews({super.key, required this.index, required this.images});

  @override
  State<FriendPhotoViews> createState() => _FriendPhotoViewsState();
}

class _FriendPhotoViewsState extends State<FriendPhotoViews> {
  // int _currentPage = widget.index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 点击图片或者空白的地方，退出预览,注意包裹Scaffold
      onTap: () => Navigator.pop(context),
      // 使用photo_view_gallery（多个图片）
      child: Scaffold(
          body: Stack(
        children: [
          // Scaffold(
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(widget.images[index]),
              );
            },
            itemCount: widget.images.length,
            pageController: PageController(
                // 点开第一张展示的图片,这里默认我门默认第一张
                initialPage: widget.index),
            // 当图片滑动，触发的事件
            onPageChanged: (index) {
              setState(() {
                widget.index = index;
              });
            },
          ),
          // ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: Text(
                "${widget.index + 1}/${widget.images.length}",
                textDirection: null,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ))
        ],
      )),
    );
  }
}
