// ignore_for_file: non_constant_identifier_names

/*
struct PacketHeader
{
    uint16    m_packetFormat;            // 2021
    uint8     m_gameMajorVersion;        // Game major version - "X.00"
    uint8     m_gameMinorVersion;        // Game minor version - "1.XX"
    uint8     m_packetVersion;           // Version of this packet type,
                                         // all start from 1
    uint8     m_packetId;                // Identifier for the packet type,
                                         // see below
    uint64    m_sessionUID;              // Unique identifier for the session
    float     m_sessionTime;             // Session timestamp
    uint32    m_frameIdentifier;         // Identifier for the frame the data
                                         // was retrieved on
    uint8     m_playerCarIndex;          // Index of player's car in the array
    uint8     m_secondaryPlayerCarIndex; // Index of secondary player's car in
                                         // the array (split-screen)
                                         // 255 if no second player
};
*/

class PacketHeader {
  final int m_packetFormat;
  final int m_gameMajorVersion;
  final int m_gameMinorVersion;
  final int m_packetVersion;
  final int m_packetId;
  final int m_sessionUID;
  final double m_sessionTime;
  final int m_frameIdentifier;
  final int m_playerCarIndex;
  final int m_secondaryPlayerCarIndex;

  const PacketHeader(
      {required this.m_packetFormat,
      required this.m_gameMajorVersion,
      required this.m_gameMinorVersion,
      required this.m_packetVersion,
      required this.m_packetId,
      required this.m_sessionUID,
      required this.m_sessionTime,
      required this.m_frameIdentifier,
      required this.m_playerCarIndex,
      required this.m_secondaryPlayerCarIndex});

  @override
  String toString() {
    return 'PacketHeader{m_packetFormat: $m_packetFormat, m_gameMajorVersion: $m_gameMajorVersion, m_gameMinorVersion: $m_gameMinorVersion, m_packetVersion: $m_packetVersion, m_packetId: $m_packetId, m_sessionUID: $m_sessionUID, m_sessionTime: $m_sessionTime, m_frameIdentifier: $m_frameIdentifier, m_playerCarIndex: $m_playerCarIndex, m_secondaryPlayerCarIndex: $m_secondaryPlayerCarIndex}';
  }
}
