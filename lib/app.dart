import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'table.dart' as t;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "we-chat",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              // backgroundColor: Colors.blue,
              // backgroundColor: Colors.red,
              color: Color.fromARGB(255, 241, 239, 239),
              elevation: 1.0,
              centerTitle: true,
              foregroundColor: Colors.black),
          // app主题内容区颜色
          // scaffoldBackgroundColor: Color.fromARGB(0, 249, 248, 248),
          scaffoldBackgroundColor: Colors.white60,
          // 底部导航栏样式
          // bottomNavigationBarTheme: BottomNavigationBarThemeData(),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color(0xF4F4F4),
            elevation: 1.0,
          )),
      home: const t.Table(),
    );
  }
}
