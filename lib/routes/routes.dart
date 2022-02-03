import 'package:flutter/material.dart';

import 'package:walkiler/routes/selectors/loading_screen.dart';
import 'package:walkiler/routes/selectors/process_request_add_booking.dart';
import 'package:walkiler/routes/selectors/process_request_add_friend.dart';
import 'package:walkiler/routes/selectors/process_request_add_wakure.dart';
import 'package:walkiler/routes/selectors/process_request_update_ticket_status.dart';
import 'package:walkiler/screens/login_screen.dart';
import 'package:walkiler/screens/map_screen.dart';
import 'package:walkiler/routes/selectors/process_request_get_wakure.dart';
import 'package:walkiler/routes/selectors/role_selector.dart';
import 'package:walkiler/views/add_wakure_view.dart';
import 'package:walkiler/views/booking_archived.dart';
import 'package:walkiler/views/booking_view.dart';
import 'package:walkiler/views/guests_info_view.dart';
import 'package:walkiler/views/guests_view.dart';
import 'package:walkiler/views/menu_view.dart';
import 'package:walkiler/views/my_wakures_view.dart';
import 'package:walkiler/views/add_guest_view.dart';
import 'package:walkiler/views/register_view.dart';
import 'package:walkiler/views/add_booking_view.dart';
import 'package:walkiler/views/ticket_view.dart';
import 'package:walkiler/views/wakure_info_view.dart';

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
  'booking_archived_view': (_) => BookingArchived_View(),
  'add_guest_view': (_) => AddGuest_View(),
  'addWakure_view': (_) => AddWakure_View(),
  'wakure_info_view': (_) => WakureInfo_View(),
  'role_selector': (_) => RoleSelector(),
  'processResponseGetWakure': (_) => ProcessRequestGetWakure(),
  'processResponseAddWakure': (_) => ProcessRequestAddWakure(),
  'processResponseAddFriend': (_) => ProcessRequestAddFriend(),
  'processResponseAddBooking': (_) => ProcessRequestAddBooking(),
  'add_booking_view': (_) => AddBooking_View(),
  'ProcessRequestUpdateTicketStatus': (_) => ProcessRequestUpdateTicketStatus(),
  'ticket_view': (_) => Ticket_View(),
};
