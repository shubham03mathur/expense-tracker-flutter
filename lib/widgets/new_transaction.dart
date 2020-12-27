import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function submitTransaction;

  NewTransaction(this.submitTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountcontroller = TextEditingController();

  submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountcontroller.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.submitTransaction(
      titleController.text,
      double.parse(amountcontroller.text),
    );

    Navigator.of(context).pop();
  }

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
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              onPressed: submitData,
              textColor: Colors.purple,
              child: Text('ADD TRANSACTION'),
            ),
          ],
        ),
      ),
    );
  }
}
