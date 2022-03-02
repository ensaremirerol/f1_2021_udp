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

/*
struct PacketParticipantsData
{
    PacketHeader    m_header;            // Header
    uint8           m_numActiveCars;	// Number of active cars in the data – should match number of
                                         // cars on HUD
    ParticipantData m_participants[22];
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import 'package:f1_2021_udp/src/types/participant/participant.dart';
import '../../type_extensions/list_extensions.dart';

class ParticipantParser extends Parser<PacketParticipantsData> {
  @override
  PacketParticipantsData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    PacketParticipantsData packet = PacketParticipantsData(
        m_header: header!,
        m_numActiveCars: parseNext(1, bd.getUint8),
        m_participants: List.generate(
            22,
            (index) => ParticipantData(
                m_aiControlled: parseNext(1, bd.getUint8),
                m_driverId: parseNext(1, bd.getUint8),
                m_networkId: parseNext(1, bd.getUint8),
                m_teamId: parseNext(1, bd.getUint8),
                m_myTeam: parseNext(1, bd.getUint8),
                m_raceNumber: parseNext(1, bd.getUint8),
                m_nationality: parseNext(1, bd.getUint8),
                m_name:
                    List<int>.generate(48, (index) => parseNext(1, bd.getUint8))
                        .charArrayToString(),
                m_yourTelemetry: parseNext(1, bd.getUint8))));
    return packet;
  }
}
