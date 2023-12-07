import 'package:fgm_app/components/text_field.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'drop_down_menu.dart';

Future<void> removeDialogBuilder(BuildContext context, {required String title}) {
  final String dialogTitle = title;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(dialogTitle),
        content: Text(S.of(context).are_you_sure_you_want_to_delete_this_flight),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(S.of(context).cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(S.of(context).delete),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
