import 'package:flutter/material.dart';
import 'package:john_deere_spa/models/ticket-response.model.dart';

class TicketItem extends StatelessWidget {
  final TicketResponse ticket;

  const TicketItem({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(ticket.date),
          Text(ticket.group),
          Text(ticket.description),
          Text(ticket.issue.name),
          Text(ticket.sentiment.name),
          Text(ticket.urgency.toString()),
          Text(ticket.impact.toString()),
        ],
      ),
    );
  }
}
