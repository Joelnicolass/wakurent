import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import 'package:walkiler/routes/selectors/role_selector.dart';
import 'package:walkiler/routes/selectors/verify_role_selector.dart';
import 'package:walkiler/views/menu_view.dart';
import 'package:walkiler/views/my_wakures_view.dart';

class ProcessRequestGetWakure extends StatelessWidget {
  const ProcessRequestGetWakure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecureStorage.getToken().then((token) {
      print(token);
    });

    return Scaffold(
      body: BlocBuilder<WakureBloc, WakureState>(builder: (context, state) {
        if (state.processRequest == false) {
          return VerifyRole();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
