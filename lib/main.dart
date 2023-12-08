import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fgm_app/services/flight_data_service.dart';
import 'package:fgm_app/theme.dart';
import 'package:fgm_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/dialog.dart';
import 'functions/functions.dart';
import 'generated/l10n.dart';
import 'package:intl/intl.dart';

import 'model/flight_data.dart';



void main() {
  Intl.defaultLocale = 'en';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: kLightTheme,
        dark: kDarkTheme,
        debugShowFloatingThemeButton: true,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: theme,
              darkTheme: darkTheme,
              home: const MyHomePage(),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const conOnBlockTime = 'ON BLOCK';
  static const conRaOnStand = 'RAMP AGENT START';


  final flightDataService = FlightDataService();
  String? selectedAirline = 'U2';
  String? flightNumber = '456';

  Map<String, String> eventTimes = {};

  void handleEvent(String event) async {
    if (selectedAirline == null || flightNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bitte alle Felder ausfüllen!')));
      return;
    }

    // Aktuelle Zeit für das Ereignis
    var currentTime = DateTime.now().toIso8601String();

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Überprüfung, ob ein Flug mit der gewählten Airline und Flugnummer existiert
    int? flightId = await flightDataService.checkIfFlightExists(
        selectedAirline!, flightNumber!);
    print(flightId);

    FlightData? flightData;
    bool success = false;

    if (flightId != null) {
      // Lade die aktuellen Daten des Fluges
      FlightData? fetchedFlightData =
      await flightDataService.getFlightData(flightId);

      if (fetchedFlightData != null) {
        // Aktualisiere die Daten mit dem neuen Ereignis
        if (event == conOnBlockTime) {
          fetchedFlightData.onBlockTime = currentTime;
        } else if (event == conRaOnStand) {
          fetchedFlightData.rampAgentStartTime = currentTime;
        }

        // Aktualisiere den vorhandenen Flug
        print("einen vorhandenen Flug wird aktualisieren");
        success =
        await flightDataService.updateData(flightId, fetchedFlightData);
      } else {
        // Zeige eine Fehlermeldung an, wenn keine Daten für den Flug gefunden wurden
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Fehler beim Laden der Flugdaten.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    } else {
      // Erstelle einen neuen Flug, wenn er nicht existiert
      flightData = FlightData(
        airline: selectedAirline,
        flightNumber: flightNumber,
        onBlockTime: event == conOnBlockTime ? currentTime : null,
        rampAgentStartTime: event == conRaOnStand ? currentTime : null,
        // Weitere Ereignisse und deren Felder können hier hinzugefügt werden
      );

      print("einen neuen Flug wird erstellt");
      success = await flightDataService.sendData(flightData);
    }

    if (success) {
      String time = getCurrentTime();
      setState(() {
        //eventTimes[event] = 'Ereignis $event um $time';
        eventTimes[event] = 'Recorded time $time';
      });

      // Zeigt eine Snackbar an, um den Erfolg der Aktion anzuzeigen
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('$event erfolgreich verarbeitet!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Zeigt eine Snackbar an, um einen Fehler bei der Datenübermittlung anzuzeigen
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Fehler beim Verarbeiten von $event.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar.medium(
              leading:
              IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {}),
              title: Text(S
                  .of(context)
                  .app_bar_title),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.flight),
                  onPressed: () =>
                      dialogBuilder(context,
                          title: S
                              .of(context)
                              .chose_your_flight, onSubscribe: updateFlightNumber),
                ),
              ],
            ),
            // Just some content big enough to have something to scroll.
            SliverToBoxAdapter(
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 8.0),
                    GroupButtonTitle(
                      title: S
                          .of(context)
                          .inbound_Time_Info,
                      icon: const Icon(Icons.flight_land),
                    ),
                    //#########################################################
                    ButtonsGroupCard(
                      buttonTitle: 'Ramp Agent Start', eventTimes: eventTimes, conOnBlockTime: conRaOnStand, onButtonPressed: onButtonPressed,
                    ),
                    ButtonsGroupCard(
                      buttonTitle: 'On Block', eventTimes: eventTimes, conOnBlockTime: conOnBlockTime, onButtonPressed: onButtonPressed,
                    ),
                    //#########################################################

                    GroupButtonTitle(
                      title: S
                          .of(context)
                          .outgoing_Time_Info,
                      icon: const Icon(Icons.flight_takeoff),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onButtonPressed(String event) {
    if (selectedAirline != null && flightNumber != null) {
      handleEvent(event);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an airline and enter a flight number!'),
        ),
      );
    }
  }

  //Callbacks für Dialog
  void updateFlightNumber(String newFlightNumber) {
    setState(() {
      flightNumber = newFlightNumber;
    });
  }

  void updateSelectedAirline(String newSelectedAirline) {
    setState(() {
      selectedAirline = newSelectedAirline;
    });
  }
}