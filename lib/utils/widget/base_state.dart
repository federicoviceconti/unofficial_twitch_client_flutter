import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  S getInstance<S>({
    bool listen = false,
  }) {
    return Provider.of<S>(context, listen: listen);
  }
}
