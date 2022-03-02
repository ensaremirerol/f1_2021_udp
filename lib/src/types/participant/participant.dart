/*
struct ParticipantData
{
    uint8      m_aiControlled;           // Whether the vehicle is AI (1) or Human (0) controlled
    uint8      m_driverId;		// Driver id - see appendix, 255 if network human
    uint8      m_networkId;		// Network id – unique identifier for network players
    uint8      m_teamId;                 // Team id - see appendix
    uint8      m_myTeam;                 // My team flag – 1 = My Team, 0 = otherwise
    uint8      m_raceNumber;             // Race number of the car
    uint8      m_nationality;            // Nationality of the driver
    char       m_name[48];               // Name of participant in UTF-8 format – null terminated
					// Will be truncated with … (U+2026) if too long
    uint8      m_yourTelemetry;          // The player's UDP setting, 0 = restricted, 1 = public
};
*/

import 'package:f1_2021_udp/src/types/packet_header.dart';

class ParticipantData {
  /// Whether the vehicle is AI (1) or Human (0) controlled
  final int m_aiControlled;

  /// Driver id - see appendix, 255 if network human
  final int m_driverId;

  /// Network id – unique identifier for network players
  final int m_networkId;

  /// Team id - see appendix
  final int m_teamId;

  /// My team flag – 1 = My Team, 0 = otherwise
  final int m_myTeam;

  /// Race number of the car
  final int m_raceNumber;

  /// Nationality of the driver
  final int m_nationality;

  /// Name of participant in UTF-8 format
  final String m_name;

  /// The player's UDP setting, 0 = restricted, 1 = public
  final int m_yourTelemetry;

  const ParticipantData(
      {required this.m_aiControlled,
      required this.m_driverId,
      required this.m_networkId,
      required this.m_teamId,
      required this.m_myTeam,
      required this.m_raceNumber,
      required this.m_nationality,
      required this.m_name,
      required this.m_yourTelemetry});

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

/*
struct PacketParticipantsData
{
    PacketHeader    m_header;            // Header
    uint8           m_numActiveCars;	// Number of active cars in the data – should match number of
                                         // cars on HUD
    ParticipantData m_participants[22];
};
*/

class PacketParticipantsData {
  final PacketHeader m_header;
  final int m_numActiveCars;
  final List<ParticipantData> m_participants;

  const PacketParticipantsData({
    required this.m_header,
    required this.m_numActiveCars,
    required this.m_participants,
  });
}
