
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

NeumorphicStyle button_style() {
  return NeumorphicStyle(
    depth: 1.5,
    intensity: 0.8,
    shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
    oppositeShadowLightSource: true,
    shape: NeumorphicShape.convex,
    boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(0),
      bottomLeft: Radius.circular(0),
      bottomRight: Radius.circular(20),
    )),
  );
}