/*
struct LapData
{
    uint32   m_lastLapTimeInMS;	       	 // Last lap time in milliseconds
    uint32   m_currentLapTimeInMS; 	 // Current time around the lap in milliseconds
    uint16   m_sector1TimeInMS;           // Sector 1 time in milliseconds
    uint16   m_sector2TimeInMS;           // Sector 2 time in milliseconds
    float    m_lapDistance;		 // Distance vehicle is around current lap in metres – could
					 // be negative if line hasn’t been crossed yet
    float    m_totalDistance;		 // Total distance travelled in session in metres – could
					 // be negative if line hasn’t been crossed yet
    float    m_safetyCarDelta;            // Delta in seconds for safety car
    uint8    m_carPosition;   	         // Car race position
    uint8    m_currentLapNum;		 // Current lap number
    uint8    m_pitStatus;            	 // 0 = none, 1 = pitting, 2 = in pit area
    uint8    m_numPitStops;            	 // Number of pit stops taken in this race
    uint8    m_sector;               	 // 0 = sector1, 1 = sector2, 2 = sector3
    uint8    m_currentLapInvalid;    	 // Current lap invalid - 0 = valid, 1 = invalid
    uint8    m_penalties;            	 // Accumulated time penalties in seconds to be added
    uint8    m_warnings;                  // Accumulated number of warnings issued
    uint8    m_numUnservedDriveThroughPens;  // Num drive through pens left to serve
    uint8    m_numUnservedStopGoPens;        // Num stop go pens left to serve
    uint8    m_gridPosition;         	 // Grid position the vehicle started the race in
    uint8    m_driverStatus;         	 // Status of driver - 0 = in garage, 1 = flying lap
                                          // 2 = in lap, 3 = out lap, 4 = on track
    uint8    m_resultStatus;              // Result status - 0 = invalid, 1 = inactive, 2 = active
                                          // 3 = finished, 4 = didnotfinish, 5 = disqualified
                                          // 6 = not classified, 7 = retired
    uint8    m_pitLaneTimerActive;     	 // Pit lane timing, 0 = inactive, 1 = active
    uint16   m_pitLaneTimeInLaneInMS;   	 // If active, the current time spent in the pit lane in ms
    uint16   m_pitStopTimerInMS;        	 // Time of the actual pit stop in ms
    uint8    m_pitStopShouldServePen;   	 // Whether the car should serve a penalty at this stop
};
*/

/*
struct PacketLapData
{
    PacketHeader    m_header;              // Header
    LapData         m_lapData[22];         // Lap data for all cars on track
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/lap_data/lap_data.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';

class LapDataParser extends Parser<PacketLapData> {
  @override
  PacketLapData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    PacketLapData packet = PacketLapData(
        m_header: header!,
        m_lapData: List.generate(
            22,
            (index) => LapData(
                m_lastLapTimeInMs: parseNext(4, bd.getUint32),
                m_currentLapTimeInMs: parseNext(4, bd.getUint32),
                m_sector1TimeInMs: parseNext(2, bd.getUint16),
                m_sector2TimeInMs: parseNext(2, bd.getUint16),
                m_lapDistance: parseNext(4, bd.getFloat32),
                m_totalDistance: parseNext(4, bd.getFloat32),
                m_safetyCarDelta: parseNext(4, bd.getFloat32),
                m_carPosition: parseNext(1, bd.getUint8),
                m_currentLapNum: parseNext(1, bd.getUint8),
                m_pitStatus: parseNext(1, bd.getUint8),
                m_numPitStops: parseNext(1, bd.getUint8),
                m_sector: parseNext(1, bd.getUint8),
                m_currentLapInvalid: parseNext(1, bd.getUint8),
                m_penalties: parseNext(1, bd.getUint8),
                m_warnings: parseNext(1, bd.getUint8),
                m_numUnservedDriveThroughPens: parseNext(1, bd.getUint8),
                m_numUnservedStopGoPens: parseNext(1, bd.getUint8),
                m_gridPosition: parseNext(1, bd.getUint8),
                m_driverStatus: parseNext(1, bd.getUint8),
                m_resultStatus: parseNext(1, bd.getUint8),
                m_pitLaneTimerActive: parseNext(1, bd.getUint8),
                m_pitLaneTimeInLaneInMs: parseNext(2, bd.getUint16),
                m_pitStopTimerInMs: parseNext(2, bd.getUint16),
                m_pitStopShouldServePen: parseNext(1, bd.getUint8))));
    return packet;
  }
}
