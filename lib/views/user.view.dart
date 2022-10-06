import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:john_deere_spa/stores/user-view.store.dart';
import 'package:provider/provider.dart';

import '../dialogs/open-ticket.dialog.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _shortDescriptionTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  late final UserViewStore store;

  @override
  void didChangeDependencies() {
    store = Provider.of<UserViewStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        elevation: 0,
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.greenAccent),
                    right: BorderSide(color: Colors.greenAccent),
                  ),
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
              store,
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
