import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/functionalities/login_webview/login_webview_viewmodel.dart';
import 'package:unofficial_twitch_mobile/utils/widget/base_widget.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebViewWidget extends StatefulWidget {
  const LoginWebViewWidget({Key? key}) : super(key: key);

  @override
  _LoginWebViewWidgetState createState() => _LoginWebViewWidgetState();
}

class _LoginWebViewWidgetState extends State<LoginWebViewWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<LoginWebViewViewModel>(context, listen: false).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(safeTop: true, child: _buildBody());
  }

  Widget _buildBody() {
    return Consumer(builder: _buildWebView);
  }

  Widget _buildWebView(
      BuildContext context, LoginWebViewViewModel notifier, Widget? child) {
    if (notifier.url == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return WebView(
      initialUrl: notifier.url,
      onPageStarted: (url) => notifier.onPageStarted(url),
      onWebResourceError: (error) => notifier.onWebResourceError(error),
      debuggingEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
