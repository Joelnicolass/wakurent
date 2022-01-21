import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import 'package:walkiler/routes/selectors/role_selector.dart';
import 'package:walkiler/routes/selectors/role_selector_wakure.dart';

class VerifyRole extends StatelessWidget {
  const VerifyRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecureStorage.getToken().then((token) {
      print(token);
    });

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return state.processRequest == false
            ? RoleSelectorWakure()
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
