import 'package:flutter/material.dart';

class PopUp {
  static Widget buildPopupDialog(
    BuildContext context,
    int numberOfButtons,
    String title,
    String text,
  ) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(text),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer'),
        ),
        if (numberOfButtons == 2)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Confirmer'),
          ),
      ],
    );
  }

  static Widget buildDoublePopupDialog(
    BuildContext context,
    String title1,
    String text1,
    String title2,
    String text2,
  ) {
    return AlertDialog(
      title: Text(title1),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(text1),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => PopUp.buildPopupDialog(
                context,
                1,
                title2,
                text2,
              ),
            );
          },
          child: const Text('Confirmer'),
        ),
      ],
    );
  }
}
