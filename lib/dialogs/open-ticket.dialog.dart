import 'package:flutter/material.dart';
import 'package:john_deere_spa/dialogs/saved-ticket-dialog.dart';
import 'package:john_deere_spa/dialogs/similar-ticket.dialog.dart';
import 'package:john_deere_spa/models/ticket.model.dart';

final _buttonTextStyle = TextStyle(
  color: Colors.black87,
  fontWeight: FontWeight.bold,
);

void showOpenTicketDialog(
  BuildContext context,
  shortDescriptionController,
  descriptionController,
  store,
) {
  shortDescriptionController.clear();
  descriptionController.clear();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(
        'Open New Ticket',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      content: Container(
        constraints: BoxConstraints(maxHeight: 400, maxWidth: 500),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15.0),
            Text(
              'Name',
              style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: shortDescriptionController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: "Provide you name...",
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Help us with detailed information...",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: _buttonTextStyle,
                  ),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () async {
                    final ticket = TicketModel(
                      name: shortDescriptionController.text,
                      description: descriptionController.text,
                    );
                    final similarTicket = await store.getSimilarTickets(ticket);
                    if (similarTicket.similarTicket is int) {
                      final ticketResponse = await store.openTicket(ticket);
                      Navigator.pop(context);
                      showSavedTicketDialog(context, ticketResponse);
                    } else {
                      showSimilarTicketDialog(context, ticket, similarTicket, store);
                    }
                  },
                  child: Text(
                    'Confirm',
                    style: _buttonTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
