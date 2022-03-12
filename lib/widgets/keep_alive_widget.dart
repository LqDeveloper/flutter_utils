import 'package:flutter/material.dart';

abstract class KeepAliveWidget extends StatefulWidget {
  const KeepAliveWidget({Key? key}) : super(key: key);

  @override
  State<KeepAliveWidget> createState() => _KeepAliveWidgetState();

  void initState() {}

  Widget build(BuildContext context);

  void dispose() {}
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
