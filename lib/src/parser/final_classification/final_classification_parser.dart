/*
struct FinalClassificationData
{
    uint8     m_position;              // Finishing position
    uint8     m_numLaps;               // Number of laps completed
    uint8     m_gridPosition;          // Grid position of the car
    uint8     m_points;                // Number of points scored
    uint8     m_numPitStops;           // Number of pit stops made
    uint8     m_resultStatus;          // Result status - 0 = invalid, 1 = inactive, 2 = active
                                       // 3 = finished, 4 = didnotfinish, 5 = disqualified
                                       // 6 = not classified, 7 = retired
    uint32    m_bestLapTimeInMS;       // Best lap time of the session in milliseconds
    double    m_totalRaceTime;         // Total race time in seconds without penalties
    uint8     m_penaltiesTime;         // Total penalties accumulated in seconds
    uint8     m_numPenalties;          // Number of penalties applied to this driver
    uint8     m_numTyreStints;         // Number of tyres stints up to maximum
    uint8     m_tyreStintsActual[8];   // Actual tyres used by this driver
    uint8     m_tyreStintsVisual[8];   // Visual tyres used by this driver
};
*/

/*
struct PacketFinalClassificationData
{
    PacketHeader    m_header;                      // Header
    uint8                      m_numCars;          // Number of cars in the final classification
    FinalClassificationData    m_classificationData[22];
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/final_classification/final_classification.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';

class FinalClassificationParser extends Parser<PacketFinalClassificationData> {
  @override
  PacketFinalClassificationData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    PacketFinalClassificationData packet = PacketFinalClassificationData(
        m_header: header!,
        m_numCars: parseNext(1, bd.getUint8),
        m_classificationData: List.generate(
            22,
            (index) => FinalClassificationData(
                m_position: parseNext(1, bd.getUint8),
                m_numLaps: parseNext(1, bd.getUint8),
                m_gridPosition: parseNext(1, bd.getUint8),
                m_points: parseNext(1, bd.getUint8),
                m_numPitStops: parseNext(1, bd.getUint8),
                m_resultStatus: parseNext(1, bd.getUint8),
                m_bestLapTimeInMS: parseNext(4, bd.getUint32),
                m_totalRaceTime: parseNext(4, bd.getFloat64),
                m_penaltiesTime: parseNext(1, bd.getUint8),
                m_numPenalties: parseNext(1, bd.getUint8),
                m_numTyreStints: parseNext(1, bd.getUint8),
                m_tyreStintsActual:
                    List.generate(8, (index) => parseNext(1, bd.getUint8)),
                m_tyreStintsVisual:
                    List.generate(8, (index) => parseNext(1, bd.getUint8)))));
    return packet;
  }
}
