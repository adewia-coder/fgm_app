// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_bar_title":
            MessageLookupByLibrary.simpleMessage("Время на Земле: 00:00:00"),
        "are_you_sure_you_want_to_delete_this_flight":
            MessageLookupByLibrary.simpleMessage(
                "Вы уверены, что хотите удалить этот рейс?"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "chose_your_flight":
            MessageLookupByLibrary.simpleMessage("Выберите Ваш Рейс"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "delete_flight_title":
            MessageLookupByLibrary.simpleMessage("Удалить Рейс"),
        "flight_number": MessageLookupByLibrary.simpleMessage("Номер Рейса"),
        "inbound_Time_Info": MessageLookupByLibrary.simpleMessage(
            "Информация о Времени Прибытия"),
        "main_title": MessageLookupByLibrary.simpleMessage("GOT"),
        "outgoing_Time_Info": MessageLookupByLibrary.simpleMessage(
            "Информация о Времени Отправления"),
        "subscribe": MessageLookupByLibrary.simpleMessage("Подписаться"),
        "unsubscribe": MessageLookupByLibrary.simpleMessage("Отменить Подписку")
      };
}
