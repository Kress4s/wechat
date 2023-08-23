import 'package:get/get.dart';
import '../table.dart' as t;
import '../widgets/friend_info/detail_page/circle_friend.dart';

class AppRouters {
  static final List<GetPage> router = [
    GetPage(
      name: "/",
      page: () => const t.Table(),
    ),
    // 查看朋友圈页面
    GetPage(
        name: "/friend_info/circle_friend", page: () => const CircleFriend())
  ];
}
