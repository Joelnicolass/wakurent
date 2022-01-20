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
import 'package:walkiler/views/invitados_info_view.dart';
import 'package:walkiler/views/invitados_view.dart';
import 'package:walkiler/views/menu_view.dart';
import 'package:walkiler/views/mis_wakure_view.dart';
import 'package:walkiler/views/quick_booking_view.dart';
import 'package:walkiler/views/register_view.dart';
import 'package:walkiler/views/calendar.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
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
  'bookingConfig_view': (_) => BookingConfig_View(),
  'calendar_view': (_) => Calendario(),
  'role_selector': (_) => RoleSelector(),
  'processResponseGetWakure': (_) => ProcessRequestGetWakure(),
  'processResponseAddWakure': (_) => ProcessRequestAddWakure(),
};
