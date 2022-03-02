import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';

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

class PacketHeaderParser extends Parser<PacketHeader> {
  @override
  PacketHeader parse(Uint8List data, [PacketHeader? header]) {
    ByteData bd = ByteData.sublistView(data);
    PacketHeader m_header = PacketHeader(
        m_packetFormat: parseNext(2, bd.getUint16),
        m_gameMajorVersion: parseNext(1, bd.getUint8),
        m_gameMinorVersion: parseNext(1, bd.getUint8),
        m_packetVersion: parseNext(1, bd.getUint8),
        m_packetId: parseNext(1, bd.getUint8),
        m_sessionUID: parseNext(8, bd.getUint64),
        m_sessionTime: parseNext(4, bd.getFloat32),
        m_frameIdentifier: parseNext(4, bd.getUint32),
        m_playerCarIndex: parseNext(1, bd.getUint8),
        m_secondaryPlayerCarIndex: parseNext(1, bd.getUint8));
    return m_header;
  }
}
