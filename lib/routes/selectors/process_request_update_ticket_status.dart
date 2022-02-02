import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import 'package:walkiler/views/booking_view.dart';

class ProcessRequestUpdateTicketStatus extends StatelessWidget {
  const ProcessRequestUpdateTicketStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecureStorage.getToken().then((token) {
      print(token);
    });

    return Scaffold(
      body: BlocBuilder<FriendBloc, FriendState>(
        builder: (context, state) {
          switch (state.processRequest) {
            case false:
              //navigator to menu_view
              return Booking_View();

            case true:
              return Scaffold(
                //responsive
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            default:
              return Scaffold(
                body: Center(
                  child: Text("Unknown"),
                ),
              );
          }
        },
      ),
    );
  }
}
