import 'package:flutter/material.dart';

class AlertDialogComponent extends StatefulWidget {
  final BuildContext pageContext;
  final Function? okAction;
  final String okText;
  final String title;
  final String message;
  Widget icon = Icon(Icons.info);

  AlertDialogComponent({
    super.key,
    required this.pageContext,
    required this.okText,
    this.okAction,
    required this.title,
    required this.message,
    required this.icon,
  });
  @override
  State<StatefulWidget> createState() {
    return _AlertDialogComponent();
  }
}

class _AlertDialogComponent extends State<AlertDialogComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [widget.icon, Text(widget.title)]),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[Text(widget.message, softWrap: true)],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(widget.okText),
          onPressed: () {
            Navigator.of(widget.pageContext).pop();

            if (widget.okAction == null) {
              return;
            }

            widget.okAction!.call();
          },
        ),
      ],
    );
  }
}
