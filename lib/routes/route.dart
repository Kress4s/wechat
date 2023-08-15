import 'package:get/get.dart';
import '../table.dart' as t;

class AppRouters {
  static final List<GetPage> router = [
    GetPage(
      name: "/",
      page: () => const t.Table(),
    )
  ];
}
