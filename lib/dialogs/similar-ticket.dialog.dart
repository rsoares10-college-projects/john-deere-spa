import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:john_deere_spa/dialogs/saved-ticket-dialog.dart';
import 'package:john_deere_spa/models/similar-ticket.model.dart';
import 'package:john_deere_spa/models/ticket.model.dart';
import 'package:john_deere_spa/stores/user-view.store.dart';

final _buttonTextStyle = TextStyle(
  color: Colors.black87,
  fontWeight: FontWeight.bold,
);

void showSimilarTicketDialog(
  BuildContext context,
  TicketModel ticket,
  SimilarTicketModel similarTicket,
  UserViewStore store,
) async {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'We found a similar ticket!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.amber,
            ),
          ],
        ),
      ),
      content: Container(
        constraints: BoxConstraints(maxHeight: 400, maxWidth: 800),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              child: Text(
                "There's a high probability that this ticket has already been opened. Maybe it's better to wait a little longer. The support team is doing it's bet to resolve this issue.",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Text(
                "Check out the most recent ticket you opened before proceeding:",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(maxHeight: 40.0),
                            child: Text(
                              'Current Issue',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.greenAccent, width: 1.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                ticket.description,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(maxHeight: 40.0),
                            child: Text(
                              'Similar Issue',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.greenAccent, width: 1.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                similarTicket.similarTicket[1],
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: _buttonTextStyle,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final ticketResponse = await store.openTicket(ticket);
                    Navigator.pop(context);
                    showSavedTicketDialog(context, ticketResponse);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save Anyway',
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
