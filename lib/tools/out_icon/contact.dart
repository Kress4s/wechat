import 'package:flutter/material.dart';

class ContactOutIcon {
  static const IconData newFriend =
      IconData(0xe58d, fontFamily: "OutIcon1", matchTextDirection: true);
  static const IconData togetherChat =
      IconData(0xe625, fontFamily: "OutIcon1", matchTextDirection: true);
  static const IconData tag =
      IconData(0xe504, fontFamily: "OutIcon1", matchTextDirection: true);
  static const IconData gongZhongHao =
      IconData(0xe613, fontFamily: "OutIcon1", matchTextDirection: true);
  static const IconData qiYeWeiXin =
      IconData(0xe6e4, fontFamily: "OutIcon1", matchTextDirection: true);
}

// ignore: must_be_immutable
class ImagesCustomerIcon extends StatelessWidget {
  // final double width;
  // final double height;
  final double radius;
  // ignore: non_constant_identifier_names
  final String Url;
  late bool isLocal;
  ImagesCustomerIcon(this.isLocal,
      {super.key, required this.radius, required this.Url});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43,
      height: 43,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      clipBehavior: Clip
          .hardEdge, // //超出部分，可裁剪, 这句话一定要有，很关键，或者实现圆角图片 CircleAvatar、ClipOval、ClipRRect组件
      child: isLocal
          ? Image.asset(
              Url,
              fit: BoxFit.cover,
            )
          : Image.network(
              Url,
              fit: BoxFit.cover,
            ),
    );
  }
}
