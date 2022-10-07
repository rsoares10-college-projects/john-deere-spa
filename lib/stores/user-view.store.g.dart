// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-view.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserViewStore on _UserViewStore, Store {
  late final _$ticketListAtom =
      Atom(name: '_UserViewStore.ticketList', context: context);

  @override
  ObservableList<TicketResponse> get ticketList {
    _$ticketListAtom.reportRead();
    return super.ticketList;
  }

  @override
  set ticketList(ObservableList<TicketResponse> value) {
    _$ticketListAtom.reportWrite(value, super.ticketList, () {
      super.ticketList = value;
    });
  }

  late final _$getAllTicketsAsyncAction =
      AsyncAction('_UserViewStore.getAllTickets', context: context);

  @override
  Future<void> getAllTickets() {
    return _$getAllTicketsAsyncAction.run(() => super.getAllTickets());
  }

  @override
  String toString() {
    return '''
ticketList: ${ticketList}
    ''';
  }
}
