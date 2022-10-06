import 'package:flutter/material.dart';
import 'package:john_deere_spa/models/ticket.model.dart';

void showOpenTicketDialog(
  BuildContext context,
  shortDescriptionController,
  descriptionController,
  store,
) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Abrir um Novo Chamado'),
      content: Container(
        constraints: BoxConstraints(maxHeight: 400, maxWidth: 500),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Motivo',
              style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: shortDescriptionController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(),
            ),
            SizedBox(height: 25.0),
            Text(
              'Descrição',
              style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25.0),
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
                    contentPadding: EdgeInsets.zero,
                    alignLabelWithHint: true,
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
                ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
                SizedBox(width: 25),
                ElevatedButton(
                    onPressed: () async {
                      final ticket = TicketModel(
                        name: shortDescriptionController.text,
                        description: descriptionController.text,
                      );
                      final ticketResponse = await store.openTicket(ticket);
                      print(ticketResponse);
                      Navigator.pop(context);
                    },
                    child: Text('Confirmar')),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
