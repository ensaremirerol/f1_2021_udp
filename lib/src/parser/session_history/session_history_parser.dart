/*struct LapHistoryData
{
    uint32    m_lapTimeInMS;           // Lap time in milliseconds
    uint16    m_sector1TimeInMS;       // Sector 1 time in milliseconds
    uint16    m_sector2TimeInMS;       // Sector 2 time in milliseconds
    uint16    m_sector3TimeInMS;       // Sector 3 time in milliseconds
    uint8     m_lapValidBitFlags;      // 0x01 bit set-lap valid,      0x02 bit set-sector 1 valid
                                       // 0x04 bit set-sector 2 valid, 0x08 bit set-sector 3 valid
};*/

/*struct TyreStintHistoryData
{
    uint8     m_endLap;                // Lap the tyre usage ends on (255 of current tyre)
    uint8     m_tyreActualCompound;    // Actual tyres used by this driver
    uint8     m_tyreVisualCompound;    // Visual tyres used by this driver
};*/

/*
struct PacketSessionHistoryData
{
    PacketHeader  m_header;                   // Header
    uint8         m_carIdx;                   // Index of the car this lap data relates to
    uint8         m_numLaps;                  // Num laps in the data (including current partial lap)
    uint8         m_numTyreStints;            // Number of tyre stints in the data
    uint8         m_bestLapTimeLapNum;        // Lap the best lap time was achieved on
    uint8         m_bestSector1LapNum;        // Lap the best Sector 1 time was achieved on
    uint8         m_bestSector2LapNum;        // Lap the best Sector 2 time was achieved on
    uint8         m_bestSector3LapNum;        // Lap the best Sector 3 time was achieved on
    LapHistoryData          m_lapHistoryData[100];	// 100 laps of data max
    TyreStintHistoryData    m_tyreStintsHistoryData[8];
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import 'package:f1_2021_udp/src/types/session_history/session_history.dart';

class SessionHistoryParser extends Parser<PacketSessionHistoryData> {
  @override
  PacketSessionHistoryData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    final PacketSessionHistoryData packet = PacketSessionHistoryData(
        m_header: header!,
        m_carIdx: parseNext(1, bd.getUint8),
        m_numLaps: parseNext(1, bd.getUint8),
        m_numTyreStints: parseNext(1, bd.getUint8),
        m_bestLapTimeLapNum: parseNext(1, bd.getUint8),
        m_bestSector1LapNum: parseNext(1, bd.getUint8),
        m_bestSector2LapNum: parseNext(1, bd.getUint8),
        m_bestSector3LapNum: parseNext(1, bd.getUint8),
        m_lapHistoryData: List.generate(
          100,
          (index) => LapHistoryData(
              m_lapTimeInMS: parseNext(4, bd.getUint32),
              m_sector1TimeInMS: parseNext(2, bd.getUint16),
              m_sector2TimeInMS: parseNext(2, bd.getUint16),
              m_sector3TimeInMS: parseNext(2, bd.getUint16),
              m_lapValidBitFlags: parseNext(1, bd.getUint8)),
        ),
        m_tyreStintsHistoryData: List.generate(
            8,
            (index) => TyreStintHistoryData(
                m_endLap: parseNext(1, bd.getUint8),
                m_tyreActualCompound: parseNext(1, bd.getUint8),
                m_tyreVisualCompound: parseNext(1, bd.getUint8))));
    return packet;
  }
}
