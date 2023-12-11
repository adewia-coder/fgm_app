import 'package:flutter/material.dart';
import '../components/remove_dialog.dart';
import '../generated/l10n.dart';

class ButtonsGroupCard extends StatelessWidget {
  final String buttonTitle;
  final Map<String, String> eventTimes;
  final String eventTime;
  final Function(String) onButtonPressed;
  final Function(String) removeEventTime;
  final Function(String, String) setEventTimeFromTimePicker;

  const ButtonsGroupCard({
    super.key,
    required this.buttonTitle,
    required this.eventTimes,
    required this.eventTime,
    required this.onButtonPressed,
    required this.removeEventTime,
    required this.setEventTimeFromTimePicker,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  if (eventTimes.containsKey(eventTime))
                    Text(eventTimes[eventTime]!),
                  const Spacer(),
                  IconButton(
                    onPressed: () => removeEventTime(eventTime),
                    icon: const Icon(Icons.delete_outline),
                  ),
                  IconButton(
                    icon: const Icon(Icons.timer_outlined),
                    onPressed: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        DateTime pickedDateTime = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                        String isoFormattedTime = pickedDateTime.toIso8601String();
                        setEventTimeFromTimePicker(eventTime, isoFormattedTime);
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  onPressed: () => onButtonPressed(eventTime),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(buttonTitle),
                      const SizedBox(width: 20),
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
  final Icon icon;

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
            Center(child: icon),
          ],
        ),
      ),
    );
  }
}
