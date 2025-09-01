import 'package:flutter/material.dart';

class ConfimDialogComponent extends StatefulWidget {
  final BuildContext pageContext;
  final Function? confirmAction;
  final Function? cancelAction;
  final String message;

  const ConfimDialogComponent({
    super.key,
    required this.pageContext,
    required this.confirmAction,
    required this.cancelAction,
    required this.message,
  });
  @override
  State<StatefulWidget> createState() {
    return _ConfimDialogComponent();
  }
}

class _ConfimDialogComponent extends State<ConfimDialogComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Aviso'),
      content: SingleChildScrollView(
        child: ListBody(children: <Widget>[Text(widget.message)]),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(widget.pageContext).pop();
            if (widget.cancelAction == null) {
              return;
            }
          },
        ),
        TextButton(
          child: Text('Confirmar'),
          onPressed: () {
            Navigator.of(widget.pageContext).pop();

            if (widget.confirmAction == null) {
              return;
            }

            widget.confirmAction!.call();
          },
        ),
      ],
    );
  }
}
