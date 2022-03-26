import 'package:flutter/material.dart';

enum LoadingStatus { loading, error, completed }

class LoadingStatusWidget extends StatelessWidget {
  final LoadingStatus loadingStatus;
  final WidgetBuilder builder;
  final WidgetBuilder? loading;
  final WidgetBuilder? error;

  const LoadingStatusWidget(
      {Key? key,
      required this.builder,
      LoadingStatus status = LoadingStatus.completed,
      this.loading,
      this.error})
      : loadingStatus = status,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (loadingStatus) {
      case LoadingStatus.loading:
        return loading != null ? loading!(context) : Container();
      case LoadingStatus.error:
        return error != null ? error!(context) : Container();
      case LoadingStatus.completed:
        return builder(context);
    }
  }
}
