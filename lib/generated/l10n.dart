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
  String get are_you_sure_you_want_to_delete_this_flight {
    return Intl.message(
      'Are you sure you want to delete this flight?',
      name: 'are_you_sure_you_want_to_delete_this_flight',
      desc: '',
      args: [],
    );
  }

  /// `DeleteFlight`
  String get delete_flight_title {
    return Intl.message(
      'DeleteFlight',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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
