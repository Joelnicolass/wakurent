import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/routes/routes.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkiler/views/calendar.dart';
import 'globals.dart' as g;

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
      BlocProvider(
        create: (context) => GpsBloc(),
      ),
      BlocProvider(
        create: (context) => LocationBloc(),
      ),
      BlocProvider(
        create: (context) => MapBloc(),
      ),
      BlocProvider(
        create: (context) => WakureBloc(),
      ),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Wakurent',
      themeMode: ThemeMode.dark,
      darkTheme: const NeumorphicThemeData.dark(
          defaultTextColor: Colors.white,
          baseColor: g.background,
          lightSource: LightSource.topLeft,
          depth: 1.5,
          intensity: 0.3,
          shadowDarkColor: Colors.black87),

      // home: Menu_View(),
      initialRoute: 'bookingConfig_view',
      routes: appRoutes,
    );
  }
}
