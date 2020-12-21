import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function submitTransaction;
  final titleController = TextEditingController();
  final amountcontroller = TextEditingController();

  NewTransaction(this.submitTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              onPressed: () {
                submitTransaction(
                  titleController.text,
                  double.parse(amountcontroller.text),
                );
              },
              textColor: Colors.purple,
              child: Text('ADD TRANSACTION'),
            ),
          ],
        ),
      ),
    );
  }
}
