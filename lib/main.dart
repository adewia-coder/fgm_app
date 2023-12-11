import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fgm_app/services/flight_data_service.dart';
import 'package:fgm_app/theme.dart';
import 'package:fgm_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/dialog.dart';
import 'functions/event_handler.dart';

import 'generated/l10n.dart';
import 'package:intl/intl.dart';

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
  /*
  static const conOnBlockTime = 'ON BLOCK';
  static const conRaOnStand = 'RAMP AGENT START';

  final flightDataService = FlightDataService();
  String? selectedAirline;
  String? flightNumber;

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
  }*/
  Map<String, String> eventTimes = {};
  String? selectedAirline;
  String? flightNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar.medium(
              leading: IconButton(
                  icon: const Icon(Icons.settings_outlined), onPressed: () {}),
              title: Text(S.of(context).app_bar_title),
              actions: <Widget>[
                Center(
                  child: Text(
                    (selectedAirline != null && flightNumber != null)
                        ? '$selectedAirline $flightNumber'
                        : 'N/A',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.flight),
                  onPressed: () => dialogBuilder(context,
                      title: S.of(context).chose_your_flight,
                      onCompleted: (String flightNumber, String airline) {
                    setState(() {
                      selectedAirline = airline;
                      this.flightNumber = flightNumber;
                    });
                  }, onUnsubscribe: () {
                    setState(() {
                      selectedAirline = null;
                      flightNumber = null;
                    });
                  }),
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
                      title: S.of(context).inbound_Time_Info,
                      icon: const Icon(Icons.flight_land),
                    ),
                    //#########################################################
                    ButtonsGroupCard(
                      buttonTitle: 'On Block', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conOnBlockTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Ramp Agent Start', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conRaOnStand,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Start Engineering', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conStartEngineeringTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'End Engineering', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conEndEngineeringTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'First Pax Out', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conFirstPaxOutTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Last Pax Out', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conLastPaxOutTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Prm Out', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conPrmOutTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Cleaning Start', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCleaningStartTime,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Cleaning End', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCleaningEndTime,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    ButtonsGroupCard(
                      buttonTitle: 'Loading Start', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conLoadingStartTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Catering Start', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCateringStartTime,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Catering End', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCateringEndTime,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    ButtonsGroupCard(
                      buttonTitle: 'Loading End', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conLoadingEndTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Deicing Request', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conDeicingRequestTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    GroupButtonTitle(
                      title: S.of(context).outgoing_Time_Info,
                      icon: const Icon(Icons.flight_takeoff),
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Boarding Ok', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conBoardingOkTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Start Boarding', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conStartBoardingTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'First Bus', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conFirstBusTime,
                      onButtonPressed: onButtonPressed,
                    ),
                    ButtonsGroupCard(
                      buttonTitle: 'Last Bus', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conLastBusTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'End Boarding', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conEndBoardingTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Prm On Stand', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conPrmOnStandTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Final Figures Gate', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conFinalFiguresGateTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Delivery Lid', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conDeliveryLidTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Door Closed', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conDoorClosedTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Pushback On Stand', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conPushbackOnStandTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Off Block', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conOffBlockTime,
                      onButtonPressed: onButtonPressed,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Pushback Request', //TODO Language
                      eventTimes: eventTimes,
                      conOnBlockTime: conPushbackRequest,
                      onButtonPressed: onButtonPressed,
                    ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Stairs Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conStairsRequest,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'ASU Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conAsuRequest,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'GPU Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conGpuRequest,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Load Team Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conLoadTeamRequest,
                    //   onButtonPressed: onButtonPressed,
                    // ),

                    //#########################################################
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
      //handleEvent(event);
      handleEvent(event, selectedAirline, flightNumber, context,
          (updatedEventTimes) {
        setState(() {
          eventTimes = updatedEventTimes;
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              S.of(context).please_select_an_airline_and_enter_a_flight_number),
        ),
      );
    }
  }
}
