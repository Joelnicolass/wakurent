import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
                ? const _EnabledGpsMessage()
                : const _AccessButton();
          },
        ),
      ),
    );
  }
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Debe activar el GPS para continuar");
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        final gpsBloc = BlocProvider.of<GpsBloc>(context);
        gpsBloc.askGpsAccess();
      },
      child: Text("Acceder"),
    );
  }
}
