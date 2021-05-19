import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformPageData {
  BuildContext context;
  LocalKey key;
  Widget child;

  PlatformPageData({this.context, this.key, this.child});
}

Page _createPlatformPage(PlatformPageData data) {
  if (isMaterial(data.context)) {
    return MaterialPage(child: data.child, key: data.key);
  } else if (isCupertino(data.context)) {
    return CupertinoPage(child: data.child, key: data.key);
  }

  throw UnsupportedError(
      "Platform not suported : ${PlatformProvider.of(data.context).platform}");
}

Page createPlatformPage({
  BuildContext context,
  LocalKey key,
  Widget child,
}) =>
    _createPlatformPage(
        PlatformPageData(context: context, key: key, child: child));