import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/screens/login_screen.dart';
import 'package:walkiler/views/addWakure_view.dart';
import 'package:walkiler/views/booking_view.dart';
import 'package:walkiler/views/invitadosInfo_view.dart';
import 'package:walkiler/views/invitados_view.dart';
import 'package:walkiler/views/menu_view.dart';
import 'package:walkiler/views/misWakure_view.dart';
import 'package:walkiler/views/quickBooking_view.dart';
import 'package:walkiler/views/register_view.dart';
import './views/menu_view.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'globals.dart' as g;
import './screens/screens.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
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
      darkTheme: const NeumorphicThemeData(
          baseColor: g.background,
          lightSource: LightSource.topLeft,
          depth: 1.5,
          intensity: 0.3,
          defaultTextColor: Colors.white,
          shadowDarkColor: Colors.black87),
      // home: Menu_View(),
      initialRoute: 'login_screen',
      routes: {
        'loading_screen': (context) => LoadingScreen(),
        'menu_view': (_) => Menu_View(),
        'login_screen': (_) => Login(),
        'register_view': (_) => Register_View(),
        'misWakure_view': (_) => MisWakure_View(),
        'invitados_view': (_) => Invitados_View(),
        'invitadosInfo_view': (_) => InvitadosInfo_View(),
        'map_screen': (_) => MapScreen(),
        'booking_view': (_) => Booking_View(),
        'quickBooking_view': (_) => QuickBooking_View(),
        'addWakure_view': (_) => AddWakure_View(),
        'login_screen': (_) => Login(),
      },
    );
  }
}
