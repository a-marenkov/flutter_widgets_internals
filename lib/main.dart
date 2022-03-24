import 'package:flutter/widgets.dart';

import 'examples/step_1_greeting.dart';
import 'examples/step_2_greeting.dart';
import 'examples/step_3_gestures.dart';
import 'examples/step_4_paint.dart';
import 'examples/step_5_custom_layout.dart';
import 'examples/step_6_render_proxy_box.dart';

enum ExampleType {
  step1Greeting,
  step2Greeting,
  step3Gestures,
  step4Paint,
  step5CustomLayout,
  step6RenderProxyBox,
}

void main() {
  const example = ExampleType.step1Greeting;
  late Widget app;

  switch (example) {
    case ExampleType.step1Greeting:
      app = greeting;
      break;

    case ExampleType.step2Greeting:
      app = const GreetingWidget();
      break;

    case ExampleType.step3Gestures:
      app = const GesturesApp();
      break;

    case ExampleType.step4Paint:
      app = const PaintApp();
      break;
    case ExampleType.step5CustomLayout:
      app = const CustomLayoutApp();
      break;
    case ExampleType.step6RenderProxyBox:
      app = const RenderProxyBoxApp();
      break;
  }

  runApp(app);
}
