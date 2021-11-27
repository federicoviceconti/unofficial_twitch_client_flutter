import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/functionalities/login_screen/login_screen_viewmodel.dart';
import 'package:unofficial_twitch_mobile/utils/widget/base_state.dart';
import 'package:unofficial_twitch_mobile/utils/widget/base_widget.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends BaseState<LoginScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(safeTop: true, child: _buildBody());
  }

  Widget _buildBody() {
    return Consumer<LoginScreenViewModel>(
      builder: (_, notifier, __) {
        return ElevatedButton(
          onPressed: () => notifier.onTapGoToLogin(),
          child: const Text('Login'),
        );
      },
    );
  }
}
