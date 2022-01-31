import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import 'package:walkiler/views/booking_view.dart';
import 'package:walkiler/views/guests_view.dart';

class ProcessRequestAddBooking extends StatelessWidget {
  const ProcessRequestAddBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          switch (state.processRequest) {
            case false:
              //navigator to menu_view
              return Booking_View();
            case true:
              return Scaffold(
                //responsive
                body: Center(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 10,
                      color: Colors.red,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
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
