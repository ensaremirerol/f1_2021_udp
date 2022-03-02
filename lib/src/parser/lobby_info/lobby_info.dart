/*
struct LobbyInfoData
{
    uint8     m_aiControlled;            // Whether the vehicle is AI (1) or Human (0) controlled
    uint8     m_teamId;                  // Team id - see appendix (255 if no team currently selected)
    uint8     m_nationality;             // Nationality of the driver
    char      m_name[48];		// Name of participant in UTF-8 format – null terminated
                                         // Will be truncated with ... (U+2026) if too long
    uint8     m_carNumber;               // Car number of the player
    uint8     m_readyStatus;             // 0 = not ready, 1 = ready, 2 = spectating
};
*/

/*
struct PacketLobbyInfoData
{
    PacketHeader    m_header;                       // Header
    // Packet specific data
    uint8               m_numPlayers;               // Number of players in the lobby data
    LobbyInfoData       m_lobbyPlayers[22];
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/lobby_info/lobby_info.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import '../../type_extensions/list_extensions.dart';

class LobbyInfoParser extends Parser<PacketLobbyInfoData> {
  @override
  PacketLobbyInfoData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    final PacketLobbyInfoData packet = PacketLobbyInfoData(
        m_header: header!,
        m_numPlayers: parseNext(1, bd.getUint8),
        m_lobbyPlayers: List.generate(
            22,
            (index) => LobbyInfoData(
                m_aiControlled: parseNext(1, bd.getUint8),
                m_teamId: parseNext(1, bd.getUint8),
                m_nationality: parseNext(1, bd.getUint8),
                m_name:
                    List<int>.generate(48, (index) => parseNext(1, bd.getInt8))
                        .charArrayToString(),
                m_carNumber: parseNext(1, bd.getUint8),
                m_readyStatus: parseNext(1, bd.getUint8))));
    return packet;
  }
}
