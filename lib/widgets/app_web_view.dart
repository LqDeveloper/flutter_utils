import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum WebViewLoadType { url, htmlString, htmlFile }

class AppWebView extends StatefulWidget {
  final WebViewLoadType type;
  final String value;
  final WebViewCreatedCallback? onWebViewCreated;
  final List<WebViewCookie> initialCookies;
  final JavascriptMode javascriptMode;
  final Set<JavascriptChannel>? javascriptChannels;
  final NavigationDelegate? navigationDelegate;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;
  final PageStartedCallback? onPageStarted;
  final PageFinishedCallback? onPageFinished;
  final PageLoadingCallback? onProgress;
  final WebResourceErrorCallback? onWebResourceError;
  final bool debuggingEnabled;
  final bool gestureNavigationEnabled;
  final String? userAgent;
  final bool zoomEnabled;
  final AutoMediaPlaybackPolicy initialMediaPlaybackPolicy;
  final bool allowsInlineMediaPlayback;
  final Color? backgroundColor;

  const AppWebView({
    Key? key,
    required this.type,
    required this.value,
    this.onWebViewCreated,
    this.initialCookies = const <WebViewCookie>[],
    this.javascriptMode = JavascriptMode.disabled,
    this.javascriptChannels,
    this.navigationDelegate,
    this.gestureRecognizers,
    this.onPageStarted,
    this.onPageFinished,
    this.onProgress,
    this.onWebResourceError,
    this.debuggingEnabled = false,
    this.gestureNavigationEnabled = false,
    this.userAgent,
    this.zoomEnabled = true,
    this.initialMediaPlaybackPolicy =
        AutoMediaPlaybackPolicy.require_user_action_for_all_media_types,
    this.allowsInlineMediaPlayback = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<AppWebView> createState() => AppWebViewState();
}

class AppWebViewState extends State<AppWebView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      onWebViewCreated: (controller) async {
        switch (widget.type) {
          case WebViewLoadType.url:
            controller.loadUrl(widget.value);
            break;
          case WebViewLoadType.htmlString:
            controller.loadHtmlString(widget.value);
            break;
          case WebViewLoadType.htmlFile:
            String fileText = await rootBundle.loadString(widget.value);
            controller.loadUrl(Uri.dataFromString(fileText,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'))
                .toString());
            break;
        }
        if (widget.onWebViewCreated != null) {
          widget.onWebViewCreated!(controller);
        }
      },
      initialCookies: widget.initialCookies,
      javascriptMode: widget.javascriptMode,
      javascriptChannels: widget.javascriptChannels,
      navigationDelegate: widget.navigationDelegate,
      gestureRecognizers: widget.gestureRecognizers,
      onPageStarted: widget.onPageStarted,
      onPageFinished: widget.onPageFinished,
      onProgress: widget.onProgress,
      onWebResourceError: widget.onWebResourceError,
      debuggingEnabled: widget.debuggingEnabled,
      gestureNavigationEnabled: widget.gestureNavigationEnabled,
      userAgent: widget.userAgent,
      zoomEnabled: widget.zoomEnabled,
      initialMediaPlaybackPolicy: widget.initialMediaPlaybackPolicy,
      allowsInlineMediaPlayback: widget.allowsInlineMediaPlayback,
      backgroundColor: widget.backgroundColor,
    );
  }
}
