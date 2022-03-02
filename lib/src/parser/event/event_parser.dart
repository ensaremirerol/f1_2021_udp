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

/*
struct PacketEventData
{
    PacketHeader    	m_header;               	// Header
    uint8           	m_eventStringCode[4];   	// Event string code, see below
    EventDataDetails	m_eventDetails;         	// Event details - should be interpreted differently
                                                 // for each type
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/event/event.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import '../../type_extensions/list_extensions.dart';

class EventParser extends Parser<PacketEventData> {
  @override
  PacketEventData parse(Uint8List data, [PacketHeader? header]) {
    ByteData bd = ByteData.view(data.buffer);
    String eventStringCode =
        List<int>.generate(4, (index) => parseNext(1, bd.getUint8))
            .charArrayToString();
    PacketEventData packet = PacketEventData(
        m_header: header!,
        m_eventStringCode: eventStringCode,
        m_eventDetails: _parseEventDetails(eventStringCode, bd));
    return packet;
  }

  EventDataDetails _parseEventDetails(String eventStringCode, ByteData bd) {
    /*
    Session Started	“SSTA”	Sent when the session starts
    Session Ended	“SEND”	Sent when the session ends
    Fastest Lap	“FTLP”	When a driver achieves the fastest lap
    Retirement	“RTMT”	When a driver retires
    DRS enabled	“DRSE”	Race control have enabled DRS
    DRS disabled	“DRSD”	Race control have disabled DRS
    Team mate in pits	“TMPT”	Your team mate has entered the pits
    Chequered flag	“CHQF”	The chequered flag has been waved
    Race Winner	“RCWN”	The race winner is announced
    Penalty Issued	“PENA”	A penalty has been issued – details in event
    Speed Trap Triggered	“SPTP”	Speed trap has been triggered by fastest speed
    Start lights	“STLG”	Start lights – number shown
    Lights out	“LGOT”	Lights out
    Drive through served	“DTSV”	Drive through penalty served
    Stop go served	“SGSV”	Stop go penalty served
    Flashback	“FLBK”	Flashback activated
    Button status	“BUTN”	Button status changed
    */

    switch (eventStringCode) {
      case "SSTA":
      case "SEND":
      case "DRSE":
      case "DRSD":
      case "CHQF":
      case "LGOT":
        return EventDataDetails();
      case "FTLP":
        return EventDataDetails(
            fastestLap: FastestLap(
          vehicleIdx: parseNext(1, bd.getUint8),
          lapTime: parseNext(4, bd.getFloat32),
        ));
      case "RTMT":
        return EventDataDetails(
            retirement: Retirement(
          vehicleIdx: parseNext(1, bd.getUint8),
        ));
      case "TMPT":
        return EventDataDetails(
            teamMateInPits: TeamMateInPits(
          vehicleIdx: parseNext(1, bd.getUint8),
        ));
      case "RCWN":
        return EventDataDetails(
            raceWinner: RaceWinner(
          vehicleIdx: parseNext(1, bd.getUint8),
        ));
      case "PENA":
        return EventDataDetails(
            penalty: Penalty(
          infringementType: parseNext(1, bd.getUint8),
          penaltyType: parseNext(1, bd.getUint8),
          vehicleIdx: parseNext(1, bd.getUint8),
          otherVehicleIdx: parseNext(1, bd.getUint8),
          time: parseNext(1, bd.getUint8),
          lapNum: parseNext(1, bd.getUint8),
          placesGained: parseNext(1, bd.getUint8),
        ));
      case "SPTP":
        return EventDataDetails(
            speedTrap: SpeedTrap(
          vehicleIdx: parseNext(1, bd.getUint8),
          speed: parseNext(4, bd.getFloat32),
          overallFastestInSession: parseNext(1, bd.getUint8),
          driverFastestInSession: parseNext(1, bd.getUint8),
        ));
      case "STLG":
        return EventDataDetails(
            startLights: StartLIghts(
          numLights: parseNext(1, bd.getUint8),
        ));
      case "DTSV":
        return EventDataDetails(
            driveThroughPenaltyServed: DriveThroughPenaltyServed(
          vehicleIdx: parseNext(1, bd.getUint8),
        ));
      case "SGSV":
        return EventDataDetails(
            stopGoPenaltyServed: StopGoPenaltyServed(
          vehicleIdx: parseNext(1, bd.getUint8),
        ));
      case "FLBK":
        return EventDataDetails(
            flashback: Flashback(
          flashbackFrameIdentifier: parseNext(4, bd.getUint32),
          flashbackSessionTime: parseNext(4, bd.getFloat32),
        ));
      case "BUTN":
        return EventDataDetails(
            buttons: Buttons(
          buttonStatus: parseNext(1, bd.getUint8),
        ));
    }
    _unimplementedOrWrongEventStringCode(eventStringCode);
  }

  Never _unimplementedOrWrongEventStringCode(String eventStringCode) {
    throw UnimplementedError(
        "Event string code $eventStringCode is not implemented");
  }
}
