import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fgm_app/theme.dart';
import 'package:fgm_app/widgets/buttons_group_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/dialog.dart';
import 'functions/event_handler.dart';

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
                      eventTime: conOnBlockTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Ramp Agent Start', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conRaOnStand,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Start Engineering', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conStartEngineeringTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'End Engineering', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conEndEngineeringTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'First Pax Out', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conFirstPaxOutTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Last Pax Out', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conLastPaxOutTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Prm Out', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conPrmOutTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Cleaning Start', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCleaningStartTime,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Cleaning End', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCleaningEndTime,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    // ),

                    ButtonsGroupCard(
                      buttonTitle: 'Loading Start', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conLoadingStartTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Catering Start', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCateringStartTime,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Catering End', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conCateringEndTime,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    // ),

                    ButtonsGroupCard(
                      buttonTitle: 'Loading End', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conLoadingEndTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Deicing Request', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conDeicingRequestTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    GroupButtonTitle(
                      title: S.of(context).outgoing_Time_Info,
                      icon: const Icon(Icons.flight_takeoff),
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Boarding Ok', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conBoardingOkTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Start Boarding', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conStartBoardingTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'First Bus', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conFirstBusTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),
                    ButtonsGroupCard(
                      buttonTitle: 'Last Bus', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conLastBusTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'End Boarding', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conEndBoardingTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Prm On Stand', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conPrmOnStandTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Final Figures Gate', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conFinalFiguresGateTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Delivery Lid', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conDeliveryLidTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Door Closed', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conDoorClosedTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Pushback On Stand', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conPushbackOnStandTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Off Block', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conOffBlockTime,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    ButtonsGroupCard(
                      buttonTitle: 'Pushback Request', //TODO Language
                      eventTimes: eventTimes,
                      eventTime: conPushbackRequest,
                      onButtonPressed: onButtonPressed,
                      removeEventTime: removeEventTime,
                      setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Stairs Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conStairsRequest,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'ASU Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conAsuRequest,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'GPU Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conGpuRequest,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
                    // ),

                    // ButtonsGroupCard(
                    //   buttonTitle: 'Load Team Request', //TODO Language
                    //   eventTimes: eventTimes,
                    //   conOnBlockTime: conLoadTeamRequest,
                    //   onButtonPressed: onButtonPressed,
                    //   removeEventTime: removeEventTime,
                    //   setEventTimeFromTimePicker: setEventTimeFromTimePicker,
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

  void setEventTimeFromTimePicker(String event, String time) async {
    if (selectedAirline != null && flightNumber != null) {
      handleEvent(event, selectedAirline, flightNumber, context,
              (time) {
            setState(() {
              eventTimes = time;
            });
          }, time);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              S.of(context).please_select_an_airline_and_enter_a_flight_number),
        ),
      );
    }
  }




  void removeEventTime(String event) async {
    if (selectedAirline == null || flightNumber == null) {
      _showSnackBar('Bitte alle Felder ausfüllen!');
      return;
    }

    // Überprüfen, ob der Flug existiert
    int? flightId = await flightDataService.checkIfFlightExists(selectedAirline!, flightNumber!);
    if (flightId == null) {
      _showSnackBar('Flug nicht gefunden.');
      return;
    }

    // Abrufen der aktuellen FlightData
    FlightData? currentFlightData = await flightDataService.getFlightData(flightId);
    if (currentFlightData == null) {
      _showSnackBar('Fehler beim Laden der Flugdaten.');
      return;
    }

    // Setzen des entsprechenden Ereignisfelds auf null
    switch (event) {
      case conOnBlockTime:
        currentFlightData.onBlockTime = null;
        break;
      case conRaOnStand:
        currentFlightData.rampAgentStartTime = null;
        break;
      case conStartEngineeringTime:
        currentFlightData.startEngineeringTime = null;
        break;
      case conEndEngineeringTime:
        currentFlightData.endEngineeringTime = null;
        break;
      case conFirstPaxOutTime:
        currentFlightData.firstPaxOutTime = null;
        break;
      case conLastPaxOutTime:
        currentFlightData.lastPaxOutTime = null;
        break;
      case conPrmOutTime:
        currentFlightData.prmOutTime = null;
        break;
      case conCleaningStartTime:
        currentFlightData.cleaningStartTime = null;
        break;
      case conCleaningEndTime:
        currentFlightData.cleaningEndTime = null;
        break;
      case conLoadingStartTime:
        currentFlightData.loadingStartTime = null;
        break;
      case conCateringStartTime:
        currentFlightData.cateringStartTime = null;
        break;
      case conCateringEndTime:
        currentFlightData.cateringEndTime = null;
        break;
      case conLoadingEndTime:
        currentFlightData.loadingEndTime = null;
        break;
      case conDeicingRequestTime:
        currentFlightData.deicingRequestTime = null;
        break;
      case conStartBoardingTime:
        currentFlightData.startBoardingTime = null;
        break;
      case conFirstBusTime:
        currentFlightData.firstBusTime = null;
        break;
      case conLastBusTime:
        currentFlightData.lastBusTime = null;
        break;
      case conBoardingOkTime:
        currentFlightData.boardingOkTime = null;
        break;
      case conEndBoardingTime:
        currentFlightData.endBoardingTime = null;
        break;
      case conPrmOnStandTime:
        currentFlightData.prmOnStandTime = null;
        break;
      case conFinalFiguresGateTime:
        currentFlightData.finalFiguresGateTime = null;
        break;
      case conDeliveryLidTime:
        currentFlightData.deliveryLidTime = null;
        break;
      case conDoorClosedTime:
        currentFlightData.doorClosedTime = null;
        break;
      case conPushbackOnStandTime:
        currentFlightData.pushbackOnStandTime = null;
        break;
      case conOffBlockTime:
        currentFlightData.offBlockTime = null;
        break;
      case conPushbackRequest:
        currentFlightData.pushbackRequest = null;
        break;
      case conStairsRequest:
        currentFlightData.stairsRequest = null;
        break;
      case conAsuRequest:
        currentFlightData.asuRequest = null;
        break;
      case conGpuRequest:
        currentFlightData.gpuRequest = null;
        break;
      case conLoadTeamRequest:
        currentFlightData.loadTeamRequest = null;
        break;
      default:
        _showSnackBar('Unbekanntes Ereignis.');
        return;
    }

    // Aktualisieren des Objekts über die API
    bool success = await flightDataService.updateData(flightId, currentFlightData);
    if (success) {
      setState(() {
        eventTimes[event] = 'null'; // Aktualisieren des UI-State
      });
      _showSnackBar('$event wurde erfolgreich entfernt.');
    } else {
      _showSnackBar('Fehler beim Aktualisieren der Flugdaten.');
    }
  }

  void _showSnackBar(String message) {
    if (context != null) {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }




}
