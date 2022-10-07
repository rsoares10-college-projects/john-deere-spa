import 'package:flutter/material.dart';
import 'package:john_deere_spa/models/ticket-response.model.dart';
import 'package:john_deere_spa/widgets/on-hover-button.widget.dart';

class TicketItem extends StatelessWidget {
  final TicketResponse ticket;

  const TicketItem({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return OnHoverButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TicketItemTile(
              content: ticket.dateCreation,
              widthConstraint: 90.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
                bottom: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            TicketItemTile(
              content: ticket.group,
              widthConstraint: 120.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
                bottom: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            TicketItemTile(
              content: ticket.issue.name,
              widthConstraint: 120.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
                bottom: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            Expanded(
              child: TicketItemTile(
                content: ticket.description,
                alignment: Alignment.centerLeft,
                widthConstraint: 90.0,
                border: Border(
                  right: BorderSide(color: Colors.teal, width: 0.5),
                  bottom: BorderSide(color: Colors.teal, width: 0.5),
                ),
              ),
            ),
            TicketItemTile(
              content: ticket.sentiment.name,
              widthConstraint: 120.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
                bottom: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            TicketItemTile(
              content: ticket.urgency.toString(),
              widthConstraint: 100.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
                bottom: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            TicketItemTile(
              content: ticket.impact.toString(),
              widthConstraint: 100.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
                bottom: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class TicketItemTile extends StatelessWidget {
  const TicketItemTile({
    Key? key,
    double? widthConstraint,
    Alignment? alignment,
    required BoxBorder border,
    required String content,
  })  : _widthConstraint = widthConstraint,
        _alignment = alignment,
        _border = border,
        _content = content,
        super(key: key);

  final double? _widthConstraint;
  final String _content;
  final BoxBorder _border;
  final Alignment? _alignment;

  final _textStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: _widthConstraint ?? 0.0, maxHeight: 30.0),
      height: double.infinity,
      width: double.infinity,
      alignment: _alignment ?? Alignment.center,
      padding: EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
        border: _border,
      ),
      child: Text(
        _content,
        style: _textStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
