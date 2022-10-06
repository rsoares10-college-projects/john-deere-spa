import 'package:flutter/material.dart';

class UserViewTicketHeader extends StatelessWidget {
  const UserViewTicketHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 40.0),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
      ),
      child: Row(
        children: <Widget>[
          HeaderTile(
            header: 'Data',
            widthConstraint: 90.0,
            border: Border(
              right: BorderSide(color: Colors.greenAccent, width: 1.0),
              bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
            ),
          ),
          HeaderTile(
            header: 'Time',
            widthConstraint: 120.0,
            border: Border(
              right: BorderSide(color: Colors.greenAccent, width: 1.0),
              bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
            ),
          ),
          HeaderTile(
            header: 'Categoria',
            widthConstraint: 150.0,
            border: Border(
              right: BorderSide(color: Colors.greenAccent, width: 1.0),
              bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
            ),
          ),
          Expanded(
              child: HeaderTile(
            header: 'Descrição',
            border: Border(
              right: BorderSide(color: Colors.greenAccent, width: 1.0),
              bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
            ),
          )),
          HeaderTile(
            header: 'Sentimento',
            widthConstraint: 120.0,
            border: Border(
              right: BorderSide(color: Colors.greenAccent, width: 1.0),
              bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
            ),
          ),
          HeaderTile(
            header: 'Impacto',
            widthConstraint: 100.0,
            border: Border(
              right: BorderSide(color: Colors.greenAccent, width: 1.0),
              bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
            ),
          ),
          HeaderTile(
            header: 'Urgência',
            widthConstraint: 100.0,
            border: Border(
              bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
            ),
          ),
        ],
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
    color: Colors.black54,
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
        color: Colors.white,
        border: _border,
      ),
      child: Text(
        _header,
        style: _textStyle,
      ),
    );
  }
}
