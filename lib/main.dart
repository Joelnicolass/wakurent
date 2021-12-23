import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/views/invitados_view.dart';
import 'package:walkiler/views/maps_view.dart';
import 'package:walkiler/views/menu_view.dart';
import 'package:walkiler/views/misWakure_view.dart';
import 'package:walkiler/views/quickBooking_view.dart';
import './views/menu_view.dart';
import 'globals.dart' as globals;

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Wakurent',
      themeMode: ThemeMode.dark,
      darkTheme: const NeumorphicThemeData(
          baseColor: Color(0xFF24272F),
          lightSource: LightSource.topLeft,
          depth: 1.5,
          intensity: 0.3,
          defaultTextColor: Colors.white,
          shadowDarkColor: Colors.black87),
      // home: Menu_View(),
      initialRoute: 'menu_view',
      routes: {
        'menu_view': (_) => Menu_View(),
        'misWakure_view': (_) => MisWakure_View(),
        'invitados_view': (_) => Invitados_View(),
        'maps_view': (_) => Maps_View(),
        'quickBooking_view': (_) => QuickBooking_View(),
      },
    );
  }
}
