class FlightData {
  String? airline;
  String? flightNumber;
  String? onBlockTime;
  String? rampAgentStartTime;
  String? startEngineeringTime;
  String? endEngineeringTime;
  String? firstPaxOutTime;
  String? lastPaxOutTime;
  String? prmOutTime;
  String? cleaningStartTime;
  String? cleaningEndTime;
  String? loadingStartTime;
  String? cateringStartTime;
  String? cateringEndTime;
  String? loadingEndTime;
  String? deicingRequestTime;
  String? startBoardingTime;
  String? firstBusTime;
  String? lastBusTime;
  String? boardingOkTime;
  String? endBoardingTime;
  String? prmOnStandTime;
  String? finalFiguresGateTime;
  String? deliveryLidTime;
  String? doorClosedTime;
  String? pushbackOnStandTime;
  String? offBlockTime;
  String? pushbackRequest;
  String? stairsRequest;
  String? asuRequest;
  String? gpuRequest;
  String? loadTeamRequest;


  FlightData({
    this.airline,
    this.flightNumber,
    this.onBlockTime,
    this.rampAgentStartTime,
    this.startEngineeringTime,
    this.endEngineeringTime,
    this.firstPaxOutTime,
    this.lastPaxOutTime,
    this.prmOutTime,
    this.cleaningStartTime,
    this.cleaningEndTime,
    this.loadingStartTime,
    this.cateringStartTime,
    this.cateringEndTime,
    this.loadingEndTime,
    this.deicingRequestTime,
    this.startBoardingTime,
    this.firstBusTime,
    this.lastBusTime,
    this.boardingOkTime,
    this.endBoardingTime,
    this.prmOnStandTime,
    this.finalFiguresGateTime,
    this.deliveryLidTime,
    this.doorClosedTime,
    this.pushbackOnStandTime,
    this.offBlockTime,
    this.pushbackRequest,
    this.stairsRequest,
    this.asuRequest,
    this.gpuRequest,
    this.loadTeamRequest,

  });

  factory FlightData.fromJson(Map<String, dynamic> json) {
    return FlightData(
      airline: json['airline'] as String?,
      flightNumber: json['flight_number'] as String?,
      onBlockTime: json['on_block_time'] as String?,
      rampAgentStartTime: json['ramp_agent_start_time'] as String?,
      startEngineeringTime: json['start_engineering_time'] as String?,
      endEngineeringTime: json['end_engineering_time'] as String?,
      firstPaxOutTime: json['first_pax_out_time'] as String?,
      lastPaxOutTime: json['last_pax_out_time'] as String?,
      prmOutTime: json['prm_out_time'] as String?,
      cleaningStartTime: json['cleaning_start_time'] as String?,
      cleaningEndTime: json['cleaning_end_time'] as String?,
      loadingStartTime: json['loading_start_time'] as String?,
      cateringStartTime: json['catering_start_time'] as String?,
      cateringEndTime: json['catering_end_time'] as String?,
      loadingEndTime: json['loading_end_time'] as String?,
      deicingRequestTime: json['deicing_request_time'] as String?,
      startBoardingTime: json['start_boarding_time'] as String?,
      firstBusTime: json['first_bus_time'] as String?,
      lastBusTime: json['last_bus_time'] as String?,
      boardingOkTime: json['boarding_ok_time'] as String?,
      endBoardingTime: json['end_boarding_time'] as String?,
      prmOnStandTime: json['prm_on_stand_time'] as String?,
      finalFiguresGateTime: json['final_figures_gate_time'] as String?,
      deliveryLidTime: json['delivery_lid_time'] as String?,
      doorClosedTime: json['door_closed_time'] as String?,
      pushbackOnStandTime: json['pushback_on_stand_time'] as String?,
      offBlockTime: json['off_block_time'] as String?,
      pushbackRequest: json['pushback_request'] as String?,
      stairsRequest: json['stairs_request'] as String?,
      asuRequest: json['asu_request'] as String?,
      gpuRequest: json['gpu_request'] as String?,
      loadTeamRequest: json['load_team_request'] as String?,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['airline'] = airline;
    data['flight_number'] = flightNumber;
    data['on_block_time'] = onBlockTime; //+++
    data['ramp_agent_start_time'] = rampAgentStartTime;//+++
    data['start_engineering_time'] = startEngineeringTime;
    data['end_engineering_time'] = endEngineeringTime;
    data['first_pax_out_time'] = firstPaxOutTime;
    data['last_pax_out_time'] = lastPaxOutTime;
    data['prm_out_time'] = prmOutTime;
    data['cleaning_start_time'] = cleaningStartTime;
    data['cleaning_end_time'] = cleaningEndTime;
    data['loading_start_time'] = loadingStartTime;
    data['catering_start_time'] = cateringStartTime;
    data['catering_end_time'] = cateringEndTime;
    data['loading_end_time'] = loadingEndTime;
    data['deicing_request_time'] = deicingRequestTime;
    data['start_boarding_time'] = startBoardingTime;
    data['first_bus_time'] = firstBusTime;
    data['last_bus_time'] = lastBusTime;
    data['boarding_ok_time'] = boardingOkTime;
    data['end_boarding_time'] = endBoardingTime;
    data['prm_on_stand_time'] = prmOnStandTime;
    data['final_figures_gate_time'] = finalFiguresGateTime;
    data['delivery_lid_time'] = deliveryLidTime;
    data['door_closed_time'] = doorClosedTime;
    data['pushback_on_stand_time'] = pushbackOnStandTime;
    data['off_block_time'] = offBlockTime;
    data['pushback_request'] = pushbackRequest;
    data['stairs_request'] = stairsRequest;
    data['asu_request'] = asuRequest;
    data['gpu_request'] = gpuRequest;
    data['load_team_request'] = loadTeamRequest;

    return data;
  }
}
