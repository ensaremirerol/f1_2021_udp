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

import 'package:f1_2021_udp/src/types/packet_header.dart';

class LobbyInfoData {
  final int m_aiControlled;
  final int m_teamId;
  final int m_nationality;
  final String m_name;
  final m_carNumber;
  final m_readyStatus;

  const LobbyInfoData(
      {required this.m_aiControlled,
      required this.m_teamId,
      required this.m_nationality,
      required this.m_name,
      required this.m_carNumber,
      required this.m_readyStatus});

  @override
  String toString() {
    return "LobbyInfoData{m_aiControlled: $m_aiControlled, m_teamId: $m_teamId, m_nationality: $m_nationality, m_name: $m_name, m_carNumber: $m_carNumber, m_readyStatus: $m_readyStatus}";
  }
}
/*
struct PacketLobbyInfoData
{
    PacketHeader    m_header;                       // Header
    // Packet specific data
    uint8               m_numPlayers;               // Number of players in the lobby data
    LobbyInfoData       m_lobbyPlayers[22];
};
*/

class PacketLobbyInfoData {
  final PacketHeader m_header;
  final int m_numPlayers;
  final List<LobbyInfoData> m_lobbyPlayers;

  const PacketLobbyInfoData(
      {required this.m_header,
      required this.m_numPlayers,
      required this.m_lobbyPlayers});

  @override
  String toString() {
    return "PacketLobbyInfoData{m_header: $m_header, m_numPlayers: $m_numPlayers, m_lobbyPlayers: $m_lobbyPlayers}";
  }
}
