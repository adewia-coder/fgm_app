import 'package:flutter/material.dart';
import '../model/flight_data.dart';
import '../services/flight_data_service.dart';
import 'functions.dart';

const conOnBlockTime = 'ON BLOCK';
const conRaOnStand = 'RAMP AGENT START';
const conStartEngineeringTime = 'START ENGINEERING TIME';
const conEndEngineeringTime = 'END ENGINEERING TIME';
const conFirstPaxOutTime = 'FIRST PAX OUT TIME';
const conLastPaxOutTime = 'LAST PAX OUT TIME';
const conPrmOutTime = 'PRM OUT TIME';
const conCleaningStartTime = 'CLEANING START TIME';
const conCleaningEndTime = 'CLEANING END TIME';
const conLoadingStartTime = 'LOADING START TIME';
const conCateringStartTime = 'CATERING START TIME';
const conCateringEndTime = 'CATERING END TIME';
const conLoadingEndTime = 'LOADING END TIME';
const conDeicingRequestTime = 'DEICING REQUEST TIME';
const conStartBoardingTime = 'START BOARDING TIME';
const conFirstBusTime = 'FIRST BUS TIME';
const conLastBusTime = 'LAST BUS TIME';
const conBoardingOkTime = 'BOARDING OK TIME';
const conEndBoardingTime = 'END BOARDING TIME';
const conPrmOnStandTime = 'PRM ON STAND TIME';
const conFinalFiguresGateTime = 'FINAL FIGURES GATE TIME';
const conDeliveryLidTime = 'DELIVERY LID TIME';
const conDoorClosedTime = 'DOOR CLOSED TIME';
const conPushbackOnStandTime = 'PUSHBACK ON STAND TIME';
const conOffBlockTime = 'OFF BLOCK TIME';
const conPushbackRequest = 'PUSHBACK REQUEST';
const conStairsRequest = 'STAIRS REQUEST';
const conAsuRequest = 'ASU REQUEST';
const conGpuRequest = 'GPU REQUEST';
const conLoadTeamRequest = 'LOAD TEAM REQUEST';




final flightDataService = FlightDataService();

Map<String, String> eventTimes = {};

void handleEvent(String event,
    String? selectedAirline,
    String? flightNumber,
    BuildContext context,
    Function(Map<String, String>) onEventProcessed) async {
  if (selectedAirline == null || flightNumber == null) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte alle Felder ausfüllen!'))); //TODO Language
    return;
  }


  var currentTime = DateTime.now().toIso8601String();

  final scaffoldMessenger = ScaffoldMessenger.of(context);


  int? flightId = await flightDataService.checkIfFlightExists(
      selectedAirline, flightNumber);

  FlightData? flightData;
  bool success = false;

  if (flightId != null) {

    FlightData? fetchedFlightData =
        await flightDataService.getFlightData(flightId);

    if (fetchedFlightData != null) {

      switch (event) {
        case conOnBlockTime:
          fetchedFlightData.onBlockTime = currentTime;
          break;
        case conRaOnStand:
          fetchedFlightData.rampAgentStartTime = currentTime;
          break;
        case conStartEngineeringTime:
          fetchedFlightData.startEngineeringTime = currentTime;
          break;
        case conEndEngineeringTime:
          fetchedFlightData.endEngineeringTime = currentTime;
          break;
        case conFirstPaxOutTime:
          fetchedFlightData.firstPaxOutTime = currentTime;
          break;
        case conLastPaxOutTime:
          fetchedFlightData.lastPaxOutTime = currentTime;
          break;
        case conPrmOutTime:
          fetchedFlightData.prmOutTime = currentTime;
          break;
        case conCleaningStartTime:
          fetchedFlightData.cleaningStartTime = currentTime;
          break;
        case conCleaningEndTime:
          fetchedFlightData.cleaningEndTime = currentTime;
          break;
        case conLoadingStartTime:
          fetchedFlightData.loadingStartTime = currentTime;
          break;
        case conCateringStartTime:
          fetchedFlightData.cateringStartTime = currentTime;
          break;
        case conCateringEndTime:
          fetchedFlightData.cateringEndTime = currentTime;
          break;
        case conLoadingEndTime:
          fetchedFlightData.loadingEndTime = currentTime;
          break;
        case conDeicingRequestTime:
          fetchedFlightData.deicingRequestTime = currentTime;
          break;
        case conStartBoardingTime:
          fetchedFlightData.startBoardingTime = currentTime;
          break;
        case conFirstBusTime:
          fetchedFlightData.firstBusTime = currentTime;
          break;
        case conLastBusTime:
          fetchedFlightData.lastBusTime = currentTime;
          break;
        case conBoardingOkTime:
          fetchedFlightData.boardingOkTime = currentTime;
          break;
        case conEndBoardingTime:
          fetchedFlightData.endBoardingTime = currentTime;
          break;
        case conPrmOnStandTime:
          fetchedFlightData.prmOnStandTime = currentTime;
          break;
        case conFinalFiguresGateTime:
          fetchedFlightData.finalFiguresGateTime = currentTime;
          break;
        case conDeliveryLidTime:
          fetchedFlightData.deliveryLidTime = currentTime;
          break;
        case conDoorClosedTime:
          fetchedFlightData.doorClosedTime = currentTime;
          break;
        case conPushbackOnStandTime:
          fetchedFlightData.pushbackOnStandTime = currentTime;
          break;
        case conOffBlockTime:
          fetchedFlightData.offBlockTime = currentTime;
          break;
        case conPushbackRequest:
          fetchedFlightData.pushbackRequest = currentTime;
          break;
        case conStairsRequest:
          fetchedFlightData.stairsRequest = currentTime;
          break;
        case conAsuRequest:
          fetchedFlightData.asuRequest = currentTime;
          break;
        case conGpuRequest:
          fetchedFlightData.gpuRequest = currentTime;
          break;
        case conLoadTeamRequest:
          fetchedFlightData.loadTeamRequest = currentTime;
          break;
        default:
        // Optional: Behandlung für nicht erkannte Ereignisse
          break;
      }



      print("einen vorhandenen Flug wird aktualisieren"); //TODO Language
      success = await flightDataService.updateData(flightId, fetchedFlightData);
    } else {

      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Fehler beim Laden der Flugdaten.'), //TODO Language
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  } else {

    flightData = FlightData(
      airline: selectedAirline,
      flightNumber: flightNumber,
      onBlockTime: event == conOnBlockTime ? currentTime : null,
      rampAgentStartTime: event == conRaOnStand ? currentTime : null,
    );

    print("einen neuen Flug wird erstellt"); //TODO Language
    success = await flightDataService.sendData(flightData);
  }

  if (success) {
    String time = getCurrentTime();
    eventTimes[event] = 'Recorded time $time'; //TODO Language

    onEventProcessed(eventTimes);



    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text('$event erfolgreich verarbeitet!'), //TODO Language
        backgroundColor: Colors.green,
      ),
    );
  } else {

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text('Fehler beim Verarbeiten von $event.'), //TODO Language
        backgroundColor: Colors.red,
      ),
    );
  }
}
