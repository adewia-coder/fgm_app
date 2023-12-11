// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ground Time: 00:00:00`
  String get app_bar_title {
    return Intl.message(
      'Ground Time: 00:00:00',
      name: 'app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `GOT`
  String get main_title {
    return Intl.message(
      'GOT',
      name: 'main_title',
      desc: '',
      args: [],
    );
  }

  /// `Inbound Time Info`
  String get inbound_Time_Info {
    return Intl.message(
      'Inbound Time Info',
      name: 'inbound_Time_Info',
      desc: '',
      args: [],
    );
  }

  /// `Outgoing Time Info`
  String get outgoing_Time_Info {
    return Intl.message(
      'Outgoing Time Info',
      name: 'outgoing_Time_Info',
      desc: '',
      args: [],
    );
  }

  /// `Chose Your Flight`
  String get chose_your_flight {
    return Intl.message(
      'Chose Your Flight',
      name: 'chose_your_flight',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe`
  String get unsubscribe {
    return Intl.message(
      'Unsubscribe',
      name: 'unsubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this flight?`
  String get are_you_sure_you_want_to_delete_this_time {
    return Intl.message(
      'Are you sure you want to delete this flight?',
      name: 'are_you_sure_you_want_to_delete_this_flight',
      desc: '',
      args: [],
    );
  }

  /// `Please select an airline and enter a flight number!`
  String get please_select_an_airline_and_enter_a_flight_number {
    return Intl.message(
      'Please select an airline and enter a flight number!',
      name: 'please_select_an_airline_and_enter_a_flight_number',
      desc: '',
      args: [],
    );
  }

  /// `Delete Flight`
  String get delete_flight_title {
    return Intl.message(
      'Delete Flight',
      name: 'delete_flight_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Flight Number`
  String get flight_number {
    return Intl.message(
      'Flight Number',
      name: 'flight_number',
      desc: '',
      args: [],
    );
  }

  /// `Subscribed successfully!`
  String get subscribed_successfully {
    return Intl.message(
      'Subscribed successfully!',
      name: 'subscribed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe successfully!`
  String get unsubscribe_successfully {
    return Intl.message(
      'Unsubscribe successfully!',
      name: 'unsubscribe_successfully',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'On Block' key

  // skipped getter for the 'Ramp Agent Start' key

  // skipped getter for the 'Start Engineering' key

  // skipped getter for the 'End Engineering' key

  // skipped getter for the 'First Pax Out' key

  // skipped getter for the 'Last Pax Out' key

  // skipped getter for the 'Prm Out' key

  // skipped getter for the 'Cleaning Start' key

  // skipped getter for the 'Cleaning End' key

  // skipped getter for the 'Loading Start' key

  // skipped getter for the 'Catering Start' key

  // skipped getter for the 'Catering End' key

  // skipped getter for the 'Loading End' key

  // skipped getter for the 'Deicing Request' key

  // skipped getter for the 'Boarding Ok' key

  // skipped getter for the 'Start Boarding' key

  // skipped getter for the 'First Bus' key

  // skipped getter for the 'Last Bus' key

  // skipped getter for the 'End Boarding' key

  // skipped getter for the 'Prm On Stand' key

  // skipped getter for the 'Final Figures Gate' key

  // skipped getter for the 'Delivery Lid' key

  // skipped getter for the 'Door Closed' key

  // skipped getter for the 'Pushback On Stand' key

  // skipped getter for the 'Off Block' key

  // skipped getter for the 'Pushback Request' key

  // skipped getter for the 'Stairs Request' key

  // skipped getter for the 'ASU Request' key

  // skipped getter for the 'GPU Request' key

  // skipped getter for the 'Load Team Request' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
