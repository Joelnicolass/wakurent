import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkiler/views/login.dart';
import 'globals.dart' as g;
import './screens/screens.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GpsBloc(),
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
      themeMode: ThemeMode.dark,
      title: 'Acufan App',
      darkTheme: const NeumorphicThemeData(
        baseColor: g.background,
        lightSource: LightSource.topLeft,
        depth: 1.5,
        intensity: 0.3,
        defaultTextColor: Colors.white,
        shadowDarkColor: Colors.black87,
      ),
      initialRoute: 'loading',
      routes: {
        'loading': (_) => const LoadingScreen(),
      },
    );
  }
}
