import 'package:fgm_app/components/text_field.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'drop_down_menu.dart';

Future<void> dialogBuilder(BuildContext context, {required String title, required Function(String) onSubscribe}) {
  final TextEditingController textController = TextEditingController();
  final String dialogTitle = title;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(dialogTitle),
        content: SizedBox(
          height: 150,
          child: Column(
            children: [
              const DropdownMenuExample(),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(controller: textController),
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
              String textValue = textController.text;
              onSubscribe(textValue);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
