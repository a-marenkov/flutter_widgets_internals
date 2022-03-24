import 'dart:ui';

import 'package:flutter/material.dart';

class PaintApp extends StatelessWidget {
  const PaintApp({Key? key}) : super(key: key);

  static const title = 'Flutter Paint';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _PaintWidget(),
    );
  }
}

class _PaintWidget extends StatelessWidget {
  const _PaintWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Molbert(),
    );
  }
}

class Molbert extends StatefulWidget {
  const Molbert({Key? key}) : super(key: key);

  @override
  _MolbertState createState() => _MolbertState();
}

class _MolbertState extends State<Molbert> {
  var points = <List<Offset>>[];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onPanDown: (details) {
            setState(() {
              points = points.toList()..add([details.localPosition]);
            });
          },
          onPanUpdate: (details) {
            setState(() {
              points = points.toList()..last.add(details.localPosition);
            });
          },
          child: CustomPaint(
            painter: _MolbertPainter(
              points,
              Theme.of(context).colorScheme.inverseSurface,
            ),
            size: Size.infinite,
          ),
        ),
        SafeArea(
          child: ElevatedButton(
            child: const Text('Clear'),
            onPressed: () {
              setState(() {
                points = <List<Offset>>[];
              });
            },
          ),
        ),
      ],
    );
  }
}

class _MolbertPainter extends CustomPainter {
  final List<List<Offset>> points;
  final Color color;

  _MolbertPainter(this.points, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    final dots = <Offset>[];
    for (final stroke in points) {
      if (stroke.length > 1) {
        canvas.drawPoints(
          PointMode.polygon,
          stroke,
          paint,
        );
      } else if (stroke.length == 1) {
        dots.add(stroke.first);
      }
    }
    canvas.drawPoints(
      PointMode.points,
      dots,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! _MolbertPainter) {
      return true;
    }

    return oldDelegate.points != points || oldDelegate.color != color;
  }
}
