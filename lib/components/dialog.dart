import 'package:fgm_app/components/text_field.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'drop_down_menu.dart';

Future<void> dialogBuilder(BuildContext context, {
  required String title,
  required Function(String, String) onCompleted,
  required Function onUnsubscribe
}) {
  final TextEditingController textController = TextEditingController();
  String selectedDropdownValue = "";
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
              DropdownMenuExample(onSelectedValue: (selectedValue) {
                selectedDropdownValue = selectedValue;
              },),
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
              onUnsubscribe();
              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(S.of(context).unsubscribe_successfully),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(S.of(context).subscribe),
            onPressed: () {
              // Überprüfen, ob das Textfeld und das Dropdown-Menü nicht leer sind
              if (textController.text.isNotEmpty && selectedDropdownValue.isNotEmpty) {
                onCompleted(textController.text, selectedDropdownValue);
                Navigator.of(context).pop();

                // Anzeigen der Snackbar-Nachricht für erfolgreiche Subscription
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).subscribed_successfully),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else {
                // Anzeigen einer Fehlermeldung, wenn Bedingungen nicht erfüllt sind
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Bitte füllen Sie alle Felder aus.'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
          ),

        ],
      );
    },
  );
}
