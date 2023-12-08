
import 'package:fgm_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/flight_data.dart';

class FlightDataService {
  Future<bool> sendData(FlightData data) async {
    var url = 'https://flightgroundmonitor.com/api/flights';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer $apiKey"
      },
      body: json.encode(data.toJson()),
    );
    return response.statusCode == 201;
  }

  Future<bool> updateData(int id, FlightData data) async {
    var url = 'https://flightgroundmonitor.com/api/flights/$id';
    var response = await http.put(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer $apiKey"
      },
      body: json.encode(data.toJson()),
    );
    return response.statusCode == 200;
  }


  Future<int?> checkIfFlightExists(String airline, String flightNumber) async {
    var currentDate =
        DateTime.now().toString().split(' ')[0]; // Aktuelles Datum als String
    var searchByFlightNumberUrl =
        'https://flightgroundmonitor.com/api/flights/search/flight_number/$flightNumber';
    var searchByAirlineUrl =
        'https://flightgroundmonitor.com/api/flights/search/airline/$airline';


    // Anfrage an den Endpunkt für Flugnummer
    var flightNumberResponse =
        await http.get(Uri.parse(searchByFlightNumberUrl), headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer $apiKey"
    });
    print(flightNumberResponse);

    // Anfrage an den Endpunkt für Airline
    var airlineResponse =
        await http.get(Uri.parse(searchByAirlineUrl), headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer $apiKey"
    });

    if (flightNumberResponse.statusCode == 200 &&
        airlineResponse.statusCode == 200) {
      var flightsByNumber = json.decode(flightNumberResponse.body) as List;
      var flightsByAirline = json.decode(airlineResponse.body) as List;

      var matchingFlight = flightsByNumber.firstWhere((flight) {
        var flightDate = flight['created_at'].split('T')[0];
        return flightsByAirline.any((airlineFlight) =>
            airlineFlight['id'] == flight['id'] && flightDate == currentDate);
      }, orElse: () => null);

      return matchingFlight != null ? matchingFlight['id'] : null;
    }
    return null; // Kein Flug gefunden
  }


  Future<FlightData?> getFlightData(int id) async {
    var url = 'https://flightgroundmonitor.com/api/flights/$id';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer IhrToken"
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // Konvertieren Sie die Antwort in ein FlightData-Objekt
      return FlightData.fromJson(data);
    }

    return null; // Rückgabe von null, falls die Anfrage fehlschlägt
  }
}

