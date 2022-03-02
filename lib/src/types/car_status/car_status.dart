// ignore_for_file: non_constant_identifier_names

/*
struct CarStatusData
{
    uint8       m_tractionControl;          // Traction control - 0 = off, 1 = medium, 2 = full
    uint8       m_antiLockBrakes;           // 0 (off) - 1 (on)
    uint8       m_fuelMix;                  // Fuel mix - 0 = lean, 1 = standard, 2 = rich, 3 = max
    uint8       m_frontBrakeBias;           // Front brake bias (percentage)
    uint8       m_pitLimiterStatus;         // Pit limiter status - 0 = off, 1 = on
    float       m_fuelInTank;               // Current fuel mass
    float       m_fuelCapacity;             // Fuel capacity
    float       m_fuelRemainingLaps;        // Fuel remaining in terms of laps (value on MFD)
    uint16      m_maxRPM;                   // Cars max RPM, point of rev limiter
    uint16      m_idleRPM;                  // Cars idle RPM
    uint8       m_maxGears;                 // Maximum number of gears
    uint8       m_drsAllowed;               // 0 = not allowed, 1 = allowed
    uint16      m_drsActivationDistance;    // 0 = DRS not available, non-zero - DRS will be available
                                            // in [X] metres
    uint8       m_actualTyreCompound;	   // F1 Modern - 16 = C5, 17 = C4, 18 = C3, 19 = C2, 20 = C1
   					   // 7 = inter, 8 = wet
   					   // F1 Classic - 9 = dry, 10 = wet
   					   // F2 – 11 = super soft, 12 = soft, 13 = medium, 14 = hard
   					   // 15 = wet
    uint8       m_visualTyreCompound;       // F1 visual (can be different from actual compound)
                                            // 16 = soft, 17 = medium, 18 = hard, 7 = inter, 8 = wet
                                            // F1 Classic – same as above
                                            // F2 ‘19, 15 = wet, 19 – super soft, 20 = soft
                                            // 21 = medium , 22 = hard
    uint8       m_tyresAgeLaps;             // Age in laps of the current set of tyres
    int8        m_vehicleFiaFlags;	   // -1 = invalid/unknown, 0 = none, 1 = green
                                            // 2 = blue, 3 = yellow, 4 = red
    float       m_ersStoreEnergy;           // ERS energy store in Joules
    uint8       m_ersDeployMode;            // ERS deployment mode, 0 = none, 1 = medium
   					   // 2 = hotlap, 3 = overtake
    float       m_ersHarvestedThisLapMGUK;  // ERS energy harvested this lap by MGU-K
    float       m_ersHarvestedThisLapMGUH;  // ERS energy harvested this lap by MGU-H
    float       m_ersDeployedThisLap;       // ERS energy deployed this lap
    uint8       m_networkPaused;            // Whether the car is paused in a network game
};
*/

import 'package:f1_2021_udp/src/types/packet_header.dart';

class CarStatusData {
  /// Traction control - 0 = off, 1 = medium, 2 = full
  final int m_tractionControl;

  /// 0 (off) - 1 (on)
  final int m_antiLockBrakes;

  /// Fuel mix - 0 = lean, 1 = standard, 2 = rich, 3 = max
  final int m_fuelMix;

  /// Front brake bias (percentage)
  final int m_frontBrakeBias;

  /// Pit limiter status - 0 = off, 1 = on
  final int m_pitLimiterStatus;

  /// Current fuel mass
  final double m_fuelInTank;

  /// Fuel capacity
  final double m_fuelCapacity;

  /// Fuel remaining in terms of laps (value on MFD)
  final double m_fuelRemainingLaps;

  /// Cars max RPM, point of rev limiter
  final int m_maxRPM;

  /// Cars idle RPM
  final int m_idleRPM;

  /// Maximum number of gears
  final int m_maxGears;

  /// 0 = not allowed, 1 = allowed
  final int m_drsAllowed;

  /// 0 = DRS not available, non-zero - DRS will be available
  final int m_drsActivationDistance;

  /// F1 Modern - 16 = C5, 17 = C4, 18 = C3, 19 = C2, 20 = C1
  /// 7 = inter, 8 = wet
  /// F1 Classic - 9 = dry, 10 = wet
  /// F2 – 11 = super soft, 12 = soft, 13 = medium, 14 = hard
  /// 15 = wet
  final int m_actualTyreCompound;

  /// F1 visual (can be different from actual compound)
  /// 16 = soft, 17 = medium, 18 = hard, 7 = inter, 8 = wet
  /// F1 Classic – same as above
  /// F2 ‘19, 15 = wet, 19 – super soft, 20 = soft
  /// 21 = medium , 22 = hard
  /// Age in laps of the current set of tyres
  final int m_visualTyreCompound;

  /// Age in laps of the current set of tyres
  final int m_tyresAgeLaps;

  /// -1 = invalid/unknown, 0 = none, 1 = green
  /// 2 = blue, 3 = yellow, 4 = red
  final int m_vehicleFiaFlags;

  /// ERS energy store in Joules
  final double m_ersStoreEnergy;

  /// ERS deployment mode, 0 = none, 1 = medium
  /// 2 = hotlap, 3 = overtake
  final int m_ersDeployMode;

  /// ERS energy harvested this lap by MGU-K
  final double m_ersHarvestedThisLapMGUK;

  /// ERS energy harvested this lap by MGU-H
  final double m_ersHarvestedThisLapMGUH;

  /// ERS energy deployed this lap
  final double m_ersDeployedThisLap;

  /// Whether the car is paused in a network game
  final int m_networkPaused;

  const CarStatusData({
    required this.m_tractionControl,
    required this.m_antiLockBrakes,
    required this.m_fuelMix,
    required this.m_frontBrakeBias,
    required this.m_pitLimiterStatus,
    required this.m_fuelInTank,
    required this.m_fuelCapacity,
    required this.m_fuelRemainingLaps,
    required this.m_maxRPM,
    required this.m_idleRPM,
    required this.m_maxGears,
    required this.m_drsAllowed,
    required this.m_drsActivationDistance,
    required this.m_actualTyreCompound,
    required this.m_visualTyreCompound,
    required this.m_tyresAgeLaps,
    required this.m_vehicleFiaFlags,
    required this.m_ersStoreEnergy,
    required this.m_ersDeployMode,
    required this.m_ersHarvestedThisLapMGUK,
    required this.m_ersHarvestedThisLapMGUH,
    required this.m_ersDeployedThisLap,
    required this.m_networkPaused,
  });

  @override
  String toString() {
    return 'CarStatusData{m_tractionControl: $m_tractionControl, m_antiLockBrakes: $m_antiLockBrakes, m_fuelMix: $m_fuelMix, m_frontBrakeBias: $m_frontBrakeBias, m_pitLimiterStatus: $m_pitLimiterStatus, m_fuelInTank: $m_fuelInTank, m_fuelCapacity: $m_fuelCapacity, m_fuelRemainingLaps: $m_fuelRemainingLaps, m_maxRPM: $m_maxRPM, m_idleRPM: $m_idleRPM, m_maxGears: $m_maxGears, m_drsAllowed: $m_drsAllowed, m_drsActivationDistance: $m_drsActivationDistance, m_actualTyreCompound: $m_actualTyreCompound, m_visualTyreCompound: $m_visualTyreCompound, m_tyresAgeLaps: $m_tyresAgeLaps, m_vehicleFiaFlags: $m_vehicleFiaFlags, m_ersStoreEnergy: $m_ersStoreEnergy, m_ersDeployMode: $m_ersDeployMode, m_ersHarvestedThisLapMGUK: $m_ersHarvestedThisLapMGUK, m_ersHarvestedThisLapMGUH: $m_ersHarvestedThisLapMGUH, m_ersDeployedThisLap: $m_ersDeployedThisLap, m_networkPaused: $m_networkPaused}';
  }
}

class PacketCarStatusData {
  final PacketHeader m_header;
  final List<CarStatusData> m_carStatusData;

  const PacketCarStatusData({
    required this.m_header,
    required this.m_carStatusData,
  });
}
