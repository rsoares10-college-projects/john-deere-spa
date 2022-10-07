import 'dart:convert';

import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:john_deere_spa/models/similar-ticket.model.dart';
import 'package:john_deere_spa/models/ticket-response.model.dart';
import 'package:john_deere_spa/models/ticket.model.dart';
import 'package:john_deere_spa/network/api.network.dart';
import 'package:mobx/mobx.dart';
part 'user-view.store.g.dart';

class UserViewStore = _UserViewStore with _$UserViewStore;

abstract class _UserViewStore with Store {
  late Dio client;

  @observable
  ObservableList<TicketResponse> ticketList = ObservableList();

  _UserViewStore() {
    client = Dio();
    client.options.headers['content-Type'] = 'application/json';
    client.options.headers['Access-Control-Allow-Origin'] = '*';
    client.options.headers['Access-Control-Allow-Methods'] = 'GET , POST, OPTIONS';
    client.httpClientAdapter = BrowserHttpClientAdapter();
  }

  Future<TicketResponse> openTicket(TicketModel ticket) async {
    final response = await client.post(API.openTicket!, data: ticket.toJson());
    return TicketResponse.fromMap(response.data);
  }

  @action
  Future<void> getAllTickets() async {
    ticketList.clear();

    final response = await client.get(API.getAllTickets!);
    for (final ticket in jsonDecode(response.data)) {
      ticketList.add(TicketResponse.fromMap(ticket));
    }
  }

  Future<SimilarTicketModel> getSimilarTickets(TicketModel ticket) async {
    final response = await client.post(API.predictSimilar!, data: ticket.toJson());
    return SimilarTicketModel.fromMap(response.data);
  }
}
