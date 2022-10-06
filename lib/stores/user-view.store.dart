import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:john_deere_spa/models/ticket-response.model.dart';
import 'package:john_deere_spa/models/ticket.model.dart';
import 'package:john_deere_spa/network/api.network.dart';
import 'package:mobx/mobx.dart';
part 'user-view.store.g.dart';

class UserViewStore = _UserViewStore with _$UserViewStore;

abstract class _UserViewStore with Store {
  late Dio client;

  _UserViewStore() {
    client = Dio();
    client.options.headers['content-Type'] = 'application/json';
    client.options.headers['Access-Control-Allow-Origin'] = '*';
    client.options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
    client.httpClientAdapter = BrowserHttpClientAdapter();
  }

  @action
  Future<TicketResponse> openTicket(TicketModel ticket) async {
    final response = await client.post(API.openTicket!);
    return TicketResponse.fromMap(response.data);
  }
}
