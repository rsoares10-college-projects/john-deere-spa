import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static String? get openTicket => dotenv.env['OPEN_TICKET'];
  static String? get getAllTickets => dotenv.env['GET_ALL_TICKETS'];
}
