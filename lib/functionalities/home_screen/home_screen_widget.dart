import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/functionalities/home_screen/home_screen_viewmodel.dart';
import 'package:unofficial_twitch_mobile/utils/widget/base_widget.dart';
import 'package:unofficial_twitch_mobile/utils/widget/base_state.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends BaseState<HomeScreenWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getInstance<HomeScreenViewModel>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      safeTop: true,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<HomeScreenViewModel>(
      builder: (_, HomeScreenViewModel notifier, __) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () => notifier.onTapInfo(),
              child: const Text('Info'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => notifier.onTapSearch(),
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }
}
