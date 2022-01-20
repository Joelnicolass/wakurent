import 'package:flutter/material.dart';

import 'package:walkiler/routes/selectors/loading_screen.dart';
import 'package:walkiler/routes/selectors/process_request_add_wakure.dart';
import 'package:walkiler/screens/login_screen.dart';
import 'package:walkiler/screens/map_screen.dart';
import 'package:walkiler/routes/selectors/process_request_get_wakure.dart';
import 'package:walkiler/routes/selectors/role_selector.dart';
import 'package:walkiler/views/Booking_config_view.dart';
import 'package:walkiler/views/add_wakure_view.dart';
import 'package:walkiler/views/booking_view.dart';
import 'package:walkiler/views/guests_info_view.dart';
import 'package:walkiler/views/guests_view.dart';
import 'package:walkiler/views/menu_view.dart';
import 'package:walkiler/views/my_wakures_view.dart';
import 'package:walkiler/views/quick_booking_view.dart';
import 'package:walkiler/views/register_view.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading_screen': (context) => LoadingScreen(),
  'menu_view': (_) => Menu_View(),
  'login_screen': (_) => Login(),
  'register_view': (_) => Register_View(),
  'my_wakures_view': (_) => MisWakure_View(),
  'guests_view': (_) => Guests_View(),
  'guestInfo_view': (_) => GuestsInfo_View(),
  'map_screen': (_) => MapScreen(),
  'booking_view': (_) => Booking_View(),
  'quickBooking_view': (_) => QuickBooking_View(),
  'addWakure_view': (_) => AddWakure_View(),
  'bookingConfig_view': (_) => BookingConfig_View(),
  'role_selector': (_) => RoleSelector(),
  'processResponseGetWakure': (_) => ProcessRequestGetWakure(),
  'processResponseAddWakure': (_) => ProcessRequestAddWakure(),
};
