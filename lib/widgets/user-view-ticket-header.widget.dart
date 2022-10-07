import 'package:flutter/material.dart';

class UserViewTicketHeader extends StatelessWidget {
  const UserViewTicketHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40.0),
      child: Card(
        elevation: 1.5,
        margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.teal,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Row(
          children: <Widget>[
            HeaderTile(
              header: 'Date',
              widthConstraint: 90.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            HeaderTile(
              header: 'Team',
              widthConstraint: 120.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            HeaderTile(
              header: 'Issue Type',
              widthConstraint: 120.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            Expanded(
                child: HeaderTile(
              header: 'Description',
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
              ),
            )),
            HeaderTile(
              header: 'Sentiment',
              widthConstraint: 120.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            HeaderTile(
              header: 'Impact',
              widthConstraint: 100.0,
              border: Border(
                right: BorderSide(color: Colors.teal, width: 0.5),
              ),
            ),
            HeaderTile(
              header: 'Urgency',
              widthConstraint: 100.0,
              border: Border(),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderTile extends StatelessWidget {
  const HeaderTile({
    Key? key,
    double? widthConstraint,
    required BoxBorder border,
    required String header,
  })  : _widthConstraint = widthConstraint,
        _border = border,
        _header = header,
        super(key: key);

  final double? _widthConstraint;
  final String _header;
  final BoxBorder _border;

  final _textStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: _widthConstraint ?? 0.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightGreen.shade50,
        border: _border,
      ),
      child: Text(
        _header,
        style: _textStyle,
      ),
    );
  }
}
