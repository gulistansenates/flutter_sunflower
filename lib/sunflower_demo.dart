import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

final double maxSliderValue = 1000.0;

class SunflowerDemo extends StatefulWidget {
  @override
  SunflowerState createState() => SunflowerState();
}

class SunflowerState extends State<SunflowerDemo> {
  double _value = maxSliderValue * 2 / 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sunflower :)"),
        actions: [
          Slider(
            min: 0.0,
            value: _value,
            max: maxSliderValue,
            activeColor: Theme.of(context).canvasColor,
            onChanged: (double value) {
              setState(() {
                print('value: ${value.toStringAsFixed(2)}');
                _value = value;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: CustomPaint(
          painter: SunflowerPainter(color: Colors.orange, seeds: _value),
          size: Size(double.infinity, double.infinity),
        ),
      ),
    );
  }
}

class SunflowerPainter extends CustomPainter {
  static final double phi = (math.sqrt(5) + 1) / 2;

  final Color color;
  final double seeds;

  SunflowerPainter({required this.color, required this.seeds});

  @override
  void paint(Canvas canvas, Size size) {
    double maxDimension = math.min(size.width, size.height);
    double scaleFactor = (maxDimension / 2.0) / math.sqrt(maxSliderValue);
    double seedRadius = scaleFactor * 0.6;

    double xCenter = size.width / 2;
    double yCenter = size.height / 2;
    double tauPhiRatio = (math.pi * 2) / phi;

    Paint paint =
        Paint()
          ..color = color
          ..style = ui.PaintingStyle.fill;

    for (int i = 0; i < seeds; i++) {
      double theta = i * tauPhiRatio;
      double r = math.sqrt(i) * scaleFactor;

      canvas.drawCircle(
        Offset(xCenter + r * math.cos(theta), yCenter - r * math.sin(theta)),
        seedRadius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(SunflowerPainter oldPainter) {
    return oldPainter.color != color || oldPainter.seeds != seeds;
  }
}
