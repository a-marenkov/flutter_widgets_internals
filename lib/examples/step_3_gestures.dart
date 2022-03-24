import 'package:flutter/material.dart';

class GesturesApp extends StatelessWidget {
  const GesturesApp({Key? key}) : super(key: key);

  static const title = 'Flutter Gestures';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _GesturesWidget(),
    );
  }
}

class _GesturesWidget extends StatefulWidget {
  const _GesturesWidget({
    Key? key,
  }) : super(key: key);

  @override
  _GesturesWidgetState createState() => _GesturesWidgetState();
}

class _GesturesWidgetState extends State<_GesturesWidget> {
  String? lastAction;

  void onAction(String action) {
    setState(() {
      lastAction = action;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAction('onTap'),
      onDoubleTap: () => onAction('onDoubleTap'),
      onPanStart: (details) => onAction(details.toString()),
      onPanDown: (details) => onAction(details.toString()),
      onPanUpdate: (details) => onAction(details.toString()),
      onPanEnd: (details) => onAction(details.toString()),
      onPanCancel: () => onAction('onPanCancel'),
      child: Scaffold(
        body: Center(
          child: Text(
            lastAction ?? '',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
