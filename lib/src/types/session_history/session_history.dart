/*struct LapHistoryData
{
    uint32    m_lapTimeInMS;           // Lap time in milliseconds
    uint16    m_sector1TimeInMS;       // Sector 1 time in milliseconds
    uint16    m_sector2TimeInMS;       // Sector 2 time in milliseconds
    uint16    m_sector3TimeInMS;       // Sector 3 time in milliseconds
    uint8     m_lapValidBitFlags;      // 0x01 bit set-lap valid,      0x02 bit set-sector 1 valid
                                       // 0x04 bit set-sector 2 valid, 0x08 bit set-sector 3 valid
};*/

import 'package:f1_2021_udp/src/types/packet_header.dart';

class LapHistoryData {
  final int m_lapTimeInMS;
  final int m_sector1TimeInMS;
  final int m_sector2TimeInMS;
  final int m_sector3TimeInMS;
  final int m_lapValidBitFlags;

  const LapHistoryData({
    required this.m_lapTimeInMS,
    required this.m_sector1TimeInMS,
    required this.m_sector2TimeInMS,
    required this.m_sector3TimeInMS,
    required this.m_lapValidBitFlags,
  });
}

/*struct TyreStintHistoryData
{
    uint8     m_endLap;                // Lap the tyre usage ends on (255 of current tyre)
    uint8     m_tyreActualCompound;    // Actual tyres used by this driver
    uint8     m_tyreVisualCompound;    // Visual tyres used by this driver
};*/

class TyreStintHistoryData {
  final int m_endLap;
  final int m_tyreActualCompound;
  final int m_tyreVisualCompound;

  const TyreStintHistoryData({
    required this.m_endLap,
    required this.m_tyreActualCompound,
    required this.m_tyreVisualCompound,
  });
}

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

class PacketSessionHistoryData {
  final PacketHeader m_header;
  final int m_carIdx;
  final int m_numLaps;
  final int m_numTyreStints;
  final int m_bestLapTimeLapNum;
  final int m_bestSector1LapNum;
  final int m_bestSector2LapNum;
  final int m_bestSector3LapNum;
  final List<LapHistoryData> m_lapHistoryData;
  final List<TyreStintHistoryData> m_tyreStintsHistoryData;

  const PacketSessionHistoryData({
    required this.m_header,
    required this.m_carIdx,
    required this.m_numLaps,
    required this.m_numTyreStints,
    required this.m_bestLapTimeLapNum,
    required this.m_bestSector1LapNum,
    required this.m_bestSector2LapNum,
    required this.m_bestSector3LapNum,
    required this.m_lapHistoryData,
    required this.m_tyreStintsHistoryData,
  });
}
