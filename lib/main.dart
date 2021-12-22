import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/views/login.dart';
import 'globals.dart' as g;

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Acufan App',
      darkTheme: NeumorphicThemeData(
        baseColor: g.background,
        lightSource: LightSource.topLeft,
        depth: 1.5,
        intensity: 0.3,
        defaultTextColor: Colors.white,
        shadowDarkColor: Colors.black87,
      ),
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (_) => Login(),
      },
    );
  }
}
