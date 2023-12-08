import 'package:flutter/material.dart';

import '../components/remove_dialog.dart';
import '../generated/l10n.dart';

class ButtonsGroupCard extends StatelessWidget {
  final String buttonTitle;
  final Map<String, String> eventTimes;
  final String conOnBlockTime;
  final Function(String) onButtonPressed;

  const ButtonsGroupCard({
    super.key,
    required this.buttonTitle,
    required this.eventTimes,
    required this.conOnBlockTime,
    required this.onButtonPressed,
  });




  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        //width: 300,
        height: 100,
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.only(left: 8),
               child: Row(
                children: [
                  if (eventTimes.containsKey(conOnBlockTime))
                    Text(eventTimes[conOnBlockTime]!),
                   const Spacer(),
                  IconButton(
                      onPressed: () => removeDialogBuilder(context,
                          title: S
                              .of(context)
                              .delete_flight_title), icon:  const Icon(Icons.delete_outline),),
                  IconButton(
                    onPressed: (){
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    }, icon:  const Icon(Icons.timer_outlined),),
                ],
                           ),
             ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  onPressed:() => onButtonPressed(conOnBlockTime),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(buttonTitle),
                      const SizedBox(
                        width: 20,
                      ),
                      //Icon(Icons.timer_outlined)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupButtonTitle extends StatelessWidget {
  final String title;
  final Icon icon; // Hinzugefügte Icon-Eigenschaft

  const GroupButtonTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(width: 16.0),
            Center(
              child: icon, // Verwenden Sie das übergebene Icon
            ),
          ],
        ),
      ),
    );
  }
}
