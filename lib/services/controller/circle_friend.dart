import 'package:get/get.dart';
import 'package:wechat/api/http.dart';
import 'package:wechat/services/models/circle_friend.dart';

class CircleFriendController extends GetxController {
  var isLoading = true.obs;
  // var infoList = <CircleFriendInfo>[].obs;
  RxList<CircleFriendInfo> infoList = <CircleFriendInfo>[].obs;

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  void getList() async {
    try {
      isLoading(true);
      var cfs = await ApiService.list();
      // 未处理报错的情况
      // assignAll 先清空infoList，在addAll
      infoList.assignAll(cfs);
    } finally {
      isLoading(false);
    }
  }
}
