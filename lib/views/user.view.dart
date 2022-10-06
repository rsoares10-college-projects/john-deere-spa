import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:john_deere_spa/stores/user-view.store.dart';
import 'package:john_deere_spa/widgets/ticket-item.widget.dart';
import 'package:provider/provider.dart';

import '../dialogs/open-ticket.dialog.dart';
import '../widgets/user-view-ticket-header.widget.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _shortDescriptionTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  late final UserViewStore _store;

  @override
  void didChangeDependencies() async {
    _store = Provider.of<UserViewStore>(context);
    await _store.getAllTickets();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox(),
        actions: [
          Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.greenAccent,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: <Widget>[
                    UserViewTicketHeader(),
                    Expanded(
                      child: Observer(
                        builder: (context) {
                          if (_store.ticketList.isEmpty) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.lightGreenAccent,
                              ),
                            );
                          }
                          return Column(
                            children: _store.ticketList.map<Widget>((item) => TicketItem(ticket: item)).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.65, 0.95),
        child: FloatingActionButton(
          onPressed: () {
            showOpenTicketDialog(
              context,
              _shortDescriptionTextEditingController,
              _descriptionTextEditingController,
              _store,
            );
          },
          child: Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
