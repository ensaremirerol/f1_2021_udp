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

import 'package:f1_2021_udp/src/types/packet_header.dart';

class LapData {
  /// Last lap time in milliseconds
  final int m_lastLapTimeInMs;

  /// Current time around the lap in milliseconds
  final int m_currentLapTimeInMs;

  /// Sector 1 time in milliseconds
  final int m_sector1TimeInMs;

  /// Sector 2 time in milliseconds
  final int m_sector2TimeInMs;

  /// Distance vehicle is around current lap in metres – could be negative if line hasn’t been crossed yet
  final double m_lapDistance;

  /// Total distance travelled in session in metres – could be negative if line hasn’t been crossed yet
  final double m_totalDistance;

  /// Delta in seconds for safety car
  final double m_safetyCarDelta;

  /// Car race position
  final int m_carPosition;

  /// Current lap number
  final int m_currentLapNum;

  /// 0 = none, 1 = pitting, 2 = in pit area
  final int m_pitStatus;

  /// Number of pit stops taken in this race
  final int m_numPitStops;

  /// 0 = sector1, 1 = sector2, 2 = sector3
  final int m_sector;

  /// Current lap invalid - 0 = valid, 1 = invalid
  final int m_currentLapInvalid;

  /// Accumulated time penalties in seconds to be added
  final int m_penalties;

  /// Accumulated number of warnings issued
  final int m_warnings;

  /// Num drive through pens left to serve
  final int m_numUnservedDriveThroughPens;

  /// Num stop go pens left to serve
  final int m_numUnservedStopGoPens;

  /// Grid position the vehicle started the race in
  final int m_gridPosition;

  /// Status of driver - 0 = in garage, 1 = flying lap
  /// 2 = in lap, 3 = out lap, 4 = on track
  final int m_driverStatus;

  /// Result status - 0 = invalid, 1 = inactive, 2 = active
  /// 3 = finished, 4 = didnotfinish, 5 = disqualified
  /// 6 = not classified, 7 = retired
  final int m_resultStatus;

  /// Pit lane timing, 0 = inactive, 1 = active
  final int m_pitLaneTimerActive;

  /// If active, the current time spent in the pit lane in ms
  final int m_pitLaneTimeInLaneInMs;

  /// Time of the actual pit stop in ms
  final int m_pitStopTimerInMs;

  /// Whether the car should serve a penalty at this stop
  final int m_pitStopShouldServePen;

  const LapData({
    required this.m_lastLapTimeInMs,
    required this.m_currentLapTimeInMs,
    required this.m_sector1TimeInMs,
    required this.m_sector2TimeInMs,
    required this.m_lapDistance,
    required this.m_totalDistance,
    required this.m_safetyCarDelta,
    required this.m_carPosition,
    required this.m_currentLapNum,
    required this.m_pitStatus,
    required this.m_numPitStops,
    required this.m_sector,
    required this.m_currentLapInvalid,
    required this.m_penalties,
    required this.m_warnings,
    required this.m_numUnservedDriveThroughPens,
    required this.m_numUnservedStopGoPens,
    required this.m_gridPosition,
    required this.m_driverStatus,
    required this.m_resultStatus,
    required this.m_pitLaneTimerActive,
    required this.m_pitLaneTimeInLaneInMs,
    required this.m_pitStopTimerInMs,
    required this.m_pitStopShouldServePen,
  });

  @override
  String toString() {
    return 'LapData{m_lastLapTimeInMs: $m_lastLapTimeInMs, m_currentLapTimeInMs: $m_currentLapTimeInMs, m_sector1TimeInMs: $m_sector1TimeInMs, m_sector2TimeInMs: $m_sector2TimeInMs, m_lapDistance: $m_lapDistance, m_totalDistance: $m_totalDistance, m_safetyCarDelta: $m_safetyCarDelta, m_carPosition: $m_carPosition, m_currentLapNum: $m_currentLapNum, m_pitStatus: $m_pitStatus, m_numPitStops: $m_numPitStops, m_sector: $m_sector, m_currentLapInvalid: $m_currentLapInvalid, m_penalties: $m_penalties, m_warnings: $m_warnings, m_numUnservedDriveThroughPens: $m_numUnservedDriveThroughPens, m_numUnservedStopGoPens: $m_numUnservedStopGoPens, m_gridPosition: $m_gridPosition, m_driverStatus: $m_driverStatus, m_resultStatus: $m_resultStatus, m_pitLaneTimerActive: $m_pitLaneTimerActive, m_pitLaneTimeInLaneInMs: $m_pitLaneTimeInLaneInMs, m_pitStopTimerInMs: $m_pitStopTimerInMs, m_pitStopShouldServePen: $m_pitStopShouldServePen}';
  }
}

/*
struct PacketLapData
{
    PacketHeader    m_header;              // Header
    LapData         m_lapData[22];         // Lap data for all cars on track
};
*/

class PacketLapData {
  final PacketHeader m_header;
  final List<LapData> m_lapData;

  const PacketLapData({
    required this.m_header,
    required this.m_lapData,
  });
}
