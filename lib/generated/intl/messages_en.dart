// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_bar_title":
            MessageLookupByLibrary.simpleMessage("Ground Time: 00:00:00"),
        "are_you_sure_you_want_to_delete_this_flight":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this flight?"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "chose_your_flight":
            MessageLookupByLibrary.simpleMessage("Chose Your Flight"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "delete_flight_title":
            MessageLookupByLibrary.simpleMessage("DeleteFlight"),
        "flight_number": MessageLookupByLibrary.simpleMessage("Flight Number"),
        "inbound_Time_Info":
            MessageLookupByLibrary.simpleMessage("Inbound Time Info"),
        "main_title": MessageLookupByLibrary.simpleMessage("GOT"),
        "outgoing_Time_Info":
            MessageLookupByLibrary.simpleMessage("Outgoing Time Info"),
        "subscribe": MessageLookupByLibrary.simpleMessage("Subscribe"),
        "unsubscribe": MessageLookupByLibrary.simpleMessage("Unsubscribe")
      };
}
