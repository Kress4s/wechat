import 'package:flutter/material.dart';

// 切换页面，保存记忆
class KeepAliveWrapper extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const KeepAliveWrapper({super.key, this.child, this.KeepAlive = true});

  final Widget? child;
  // ignore: non_constant_identifier_names
  final bool KeepAlive;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.KeepAlive;

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.KeepAlive != widget.KeepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
