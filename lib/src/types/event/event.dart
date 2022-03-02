// ignore_for_file: non_constant_identifier_names

/*
// The event details packet is different for each type of event.
// Make sure only the correct type is interpreted.
union EventDataDetails
{
    struct
    {
        uint8	vehicleIdx; // Vehicle index of car achieving fastest lap
        float	lapTime;    // Lap time is in seconds
    } FastestLap;
    struct
    {
        uint8   vehicleIdx; // Vehicle index of car retiring
    } Retirement;
    struct
    {
        uint8   vehicleIdx; // Vehicle index of team mate
    } TeamMateInPits;
    struct
    {
        uint8   vehicleIdx; // Vehicle index of the race winner
    } RaceWinner;
    struct
    {
    	uint8 penaltyType;		// Penalty type – see Appendices
        uint8 infringementType;		// Infringement type – see Appendices
        uint8 vehicleIdx;         	// Vehicle index of the car the penalty is applied to
        uint8 otherVehicleIdx;    	// Vehicle index of the other car involved
        uint8 time;               	// Time gained, or time spent doing action in seconds
        uint8 lapNum;             	// Lap the penalty occurred on
        uint8 placesGained;       	// Number of places gained by this
    } Penalty;
    struct
    {
        uint8 vehicleIdx;		// Vehicle index of the vehicle triggering speed trap
        float speed;      		// Top speed achieved in kilometres per hour
        uint8 overallFastestInSession;   // Overall fastest speed in session = 1, otherwise 0
        uint8 driverFastestInSession;    // Fastest speed for driver in session = 1, otherwise 0
    } SpeedTrap;
    struct
    {
        uint8 numLights;		// Number of lights showing
    } StartLIghts;
    struct
    {
        uint8 vehicleIdx;                 // Vehicle index of the vehicle serving drive through
    } DriveThroughPenaltyServed;
    struct
    {
        uint8 vehicleIdx;                 // Vehicle index of the vehicle serving stop go
    } StopGoPenaltyServed;
    struct
    {
        uint32 flashbackFrameIdentifier;  // Frame identifier flashed back to
        float flashbackSessionTime;       // Session time flashed back to
    } Flashback;
    struct
    {
        uint32         m_buttonStatus;    // Bit flags specifying which buttons are being pressed
                                          // currently - see appendices
    } Buttons;
};
*/

import 'package:f1_2021_udp/src/types/packet_header.dart';

class FastestLap {
  /// Vehicle index of car achieving fastest lap
  final int vehicleIdx;
  /// Lap time is in seconds
  final double lapTime;

  const FastestLap({
    required this.vehicleIdx,
    required this.lapTime,
  });
}

class Retirement {
  /// Vehicle index of car retiring
  final int vehicleIdx;

  const Retirement({
    required this.vehicleIdx,
  });
}

class TeamMateInPits {
  /// Vehicle index of team mate
  final int vehicleIdx;

  const TeamMateInPits({
    required this.vehicleIdx,
  });
}

class RaceWinner {
  /// Vehicle index of the race winner
  final int vehicleIdx;

  const RaceWinner({
    required this.vehicleIdx,
  });
}

class Penalty {
  /// Penalty type
  final int penaltyType;
  final int infringementType;
  /// Vehicle index of the car the penalty is applied to
  final int vehicleIdx;
  /// Vehicle index of the other car involved
  final int otherVehicleIdx;
  /// Time gained, or time spent doing action in seconds
  final int time;
  /// // Lap the penalty occurred on
  final int lapNum;
  /// Number of places gained by this
  final int placesGained;

  const Penalty({
    required this.penaltyType,
    required this.infringementType,
    required this.vehicleIdx,
    required this.otherVehicleIdx,
    required this.time,
    required this.lapNum,
    required this.placesGained,
  });
}

class SpeedTrap {
  /// Vehicle index of the vehicle triggering speed trap
  final int vehicleIdx;
  /// Top speed achieved in kilometres per hour
  final double speed;
  /// Overall fastest speed in session = 1, otherwise 0
  final int overallFastestInSession;
  /// Fastest speed for driver in session = 1, otherwise 0
  final int driverFastestInSession;

  const SpeedTrap({
    required this.vehicleIdx,
    required this.speed,
    required this.overallFastestInSession,
    required this.driverFastestInSession,
  });
}

class StartLIghts {
  /// Number of lights showing
  final int numLights;

  const StartLIghts({
    required this.numLights,
  });
}

class DriveThroughPenaltyServed {
  /// Vehicle index of the vehicle serving drive through
  final int vehicleIdx;

  const DriveThroughPenaltyServed({
    required this.vehicleIdx,
  });
}

class StopGoPenaltyServed {
  /// Vehicle index of the vehicle serving stop go
  final int vehicleIdx;

  const StopGoPenaltyServed({
    required this.vehicleIdx,
  });
}

class Flashback {
  /// Frame identifier flashed back to
  final int flashbackFrameIdentifier;
  /// Session time flashed back to
  final double flashbackSessionTime;

  const Flashback({
    required this.flashbackFrameIdentifier,
    required this.flashbackSessionTime,
  });
}

class Buttons {
  /// Bit flags specifying which buttons are being pressed
  final int buttonStatus;

  const Buttons({
    required this.buttonStatus,
  });
}

class EventDataDetails {
  final FastestLap? fastestLap;
  final Retirement? retirement;
  final TeamMateInPits? teamMateInPits;
  final RaceWinner? raceWinner;
  final Penalty? penalty;
  final SpeedTrap? speedTrap;
  final StartLIghts? startLights;
  final DriveThroughPenaltyServed? driveThroughPenaltyServed;
  final StopGoPenaltyServed? stopGoPenaltyServed;
  final Flashback? flashback;
  final Buttons? buttons;

  EventDataDetails({
    this.fastestLap,
    this.retirement,
    this.teamMateInPits,
    this.raceWinner,
    this.penalty,
    this.speedTrap,
    this.startLights,
    this.driveThroughPenaltyServed,
    this.stopGoPenaltyServed,
    this.flashback,
    this.buttons,
  });

  @override
  String toString() {
    return 'EventDataDetails{fastestLap: $fastestLap, retirement: $retirement, teamMateInPits: $teamMateInPits, raceWinner: $raceWinner, penalty: $penalty, speedTrap: $speedTrap, startLights: $startLights, driveThroughPenaltyServed: $driveThroughPenaltyServed, stopGoPenaltyServed: $stopGoPenaltyServed, flashback: $flashback, buttons: $buttons}';
  }
}

/*
struct PacketEventData
{
    PacketHeader    	m_header;               	// Header
    uint8           	m_eventStringCode[4];   	// Event string code, see below
    EventDataDetails	m_eventDetails;         	// Event details - should be interpreted differently
                                                 // for each type
};
*/

class PacketEventData {
  final PacketHeader m_header;
  // Event string code  
  final String m_eventStringCode;
  final EventDataDetails m_eventDetails;

  const PacketEventData({
    required this.m_header,
    required this.m_eventStringCode,
    required this.m_eventDetails,
  });
}
