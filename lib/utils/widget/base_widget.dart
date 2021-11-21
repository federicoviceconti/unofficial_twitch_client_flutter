import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  final bool? safeTop;

  const BaseWidget({
    Key? key,
    this.safeTop,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: safeTop ?? false,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: child,
      ),
    );
  }
}
