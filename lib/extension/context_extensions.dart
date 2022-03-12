import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ShowUtils on BuildContext {
  Future<T?> showMaterialDialog<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    return showDialog(
      context: this,
      builder: builder,
      //点击背景是否消失
      barrierDismissible: barrierDismissible,
      //背景颜色
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator:
          useRootNavigator, //参数用于确定是否将对话框推送到给定“context”最远或最接近的默认情况下，useRootNavigator为“true”
    );
  }

  Future<T?> showIOSDialog<T>({
    required WidgetBuilder builder,
    String? barrierLabel,
    bool useRootNavigator = true,
    bool barrierDismissible = false,
    RouteSettings? routeSettings,
  }) {
    return showCupertinoDialog(
      context: this,
      builder: builder,
      barrierLabel: barrierLabel,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
    );
  }

  Future<T?> showCustomDialog<T>({
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = false,
    String? barrierLabel,
    Color barrierColor = const Color(0x80000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    return showGeneralDialog(
      context: this,
      pageBuilder: pageBuilder,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }

  PersistentBottomSheetController<T> showBS<T>({
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    AnimationController? transitionAnimationController,
  }) {
    return showBottomSheet(
      context: this,
      builder: builder,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      enableDrag: enableDrag,
      transitionAnimationController: transitionAnimationController,
    );
  }

  Future<T?> showModalBS<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    return showModalBottomSheet(
      context: this,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      SnackBar snackBar) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

extension ThemeExtensions on BuildContext {
  ///获取ThemeDa
  ThemeData get theme => Theme.of(this);

  ///获取屏幕尺寸
  Size get mediaQuerySize => MediaQuery.of(this).size;

  ///获取屏幕宽度
  double get width => mediaQuerySize.width;

  ///获取屏幕高度
  double get height => mediaQuerySize.height;

  ///为屏幕内边距，一般是刘海儿屏或异形屏中被系统遮挡部分边距
  EdgeInsets get padding => MediaQuery.of(this).padding;

  ///视图内边距，为屏幕被刘海儿屏或异形屏中被系统遮挡部分，从 MediaQuery 边界的边缘计算；
  ///此值是保持不变；例如，屏幕底部的软件键盘可能会覆盖并占用需要底部填充的相同区域，因此不会影响此值；
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  ///为键盘弹出时等遮挡屏幕边距，其中 viewInsets.bottom 为键盘高度
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  ///为手势边距，如 Android Q 之后添加的向左滑动关闭页面等
  EdgeInsets get systemGestureInsets => MediaQuery.of(this).systemGestureInsets;

  ///获取屏幕的方向
  Orientation get orientation => MediaQuery.of(this).orientation;

  ///是否是横屏
  bool get isLandscape => orientation == Orientation.landscape;

  ///是否是竖屏
  bool get isPortrait => orientation == Orientation.portrait;

  ///获取RenderBox
  RenderBox? get renderBox {
    RenderObject? renderObject = findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      return renderObject;
    }
    return null;
  }
}
