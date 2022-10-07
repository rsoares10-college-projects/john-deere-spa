import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:john_deere_spa/models/ticket-response.model.dart';

final _buttonTextStyle = TextStyle(
  color: Colors.black87,
  fontWeight: FontWeight.bold,
);

void showSavedTicketDialog(
  BuildContext context,
  TicketResponse ticket,
) {
  DateTime dateToday = new DateTime.now();
  String date = dateToday.toString().substring(0, 10);

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Row(
        children: <Widget>[
          Text(
            'Ticket was Successfully Opened!',
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
            FontAwesomeIcons.check,
            color: Colors.lightGreen,
          ),
        ],
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
              constraints: BoxConstraints(maxHeight: 50.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.greenAccent,
                    width: 1.0,
                  ),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Date:',
                            style: TextStyle(fontSize: 18.0, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            date,
                            style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Team:',
                            style: TextStyle(fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Flexible(
                            child: Text(
                              ticket.group,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16.0, color: Colors.black54, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Issue:',
                            style: TextStyle(fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            ticket.issue.name,
                            style: TextStyle(fontSize: 16.0, color: Colors.black54, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 50.0),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.greenAccent,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sentiment:',
                            style: TextStyle(fontSize: 18.0, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            ticket.sentiment.name,
                            style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Impact:',
                            style: TextStyle(fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            ticket.impact.toString(),
                            style: TextStyle(fontSize: 16.0, color: Colors.black54, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Urgency:',
                            style: TextStyle(fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            ticket.urgency.toString(),
                            style: TextStyle(fontSize: 16.0, color: Colors.black54, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 18.0, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.greenAccent,
                      width: 1.0,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    ticket.description,
                  ),
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
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
