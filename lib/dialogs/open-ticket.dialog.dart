import 'package:flutter/material.dart';
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
              'Issue',
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
                hintText: "What's the issue?",
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
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final ticket = TicketModel(
                      name: shortDescriptionController.text,
                      description: descriptionController.text,
                    );
                    await store.openTicket(ticket);
                    Navigator.pop(context);
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
