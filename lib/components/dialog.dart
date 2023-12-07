import 'package:fgm_app/components/text_field.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'drop_down_menu.dart';

Future<void> dialogBuilder(BuildContext context, {required String title}) {
  final String dialogTitle = title;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(dialogTitle),
        content: const SizedBox(
          height: 150,
          child: Column(
            children: [
              DropdownMenuExample(),
              SizedBox(
                height: 16,
              ),
              CustomTextField(),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(S.of(context).unsubscribe),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(S.of(context).subscribe),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
