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

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/car_status/car_status.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';

class CarStatusDataParser extends Parser<PacketCarStatusData> {
  @override
  PacketCarStatusData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    final PacketCarStatusData packet = PacketCarStatusData(
        m_header: header!,
        m_carStatusData: List.generate(
            22,
            (index) => CarStatusData(
                m_tractionControl: parseNext(1, bd.getUint8),
                m_antiLockBrakes: parseNext(1, bd.getUint8),
                m_fuelMix: parseNext(1, bd.getUint8),
                m_frontBrakeBias: parseNext(1, bd.getUint8),
                m_pitLimiterStatus: parseNext(1, bd.getUint8),
                m_fuelInTank: parseNext(4, bd.getFloat32),
                m_fuelCapacity: parseNext(4, bd.getFloat32),
                m_fuelRemainingLaps: parseNext(4, bd.getFloat32),
                m_maxRPM: parseNext(2, bd.getUint16),
                m_idleRPM: parseNext(2, bd.getUint16),
                m_maxGears: parseNext(1, bd.getUint8),
                m_drsAllowed: parseNext(1, bd.getUint8),
                m_drsActivationDistance: parseNext(2, bd.getUint16),
                m_actualTyreCompound: parseNext(1, bd.getUint8),
                m_visualTyreCompound: parseNext(1, bd.getUint8),
                m_tyresAgeLaps: parseNext(1, bd.getUint8),
                m_vehicleFiaFlags: parseNext(1, bd.getInt8),
                m_ersStoreEnergy: parseNext(4, bd.getFloat32),
                m_ersDeployMode: parseNext(1, bd.getUint8),
                m_ersHarvestedThisLapMGUK: parseNext(4, bd.getFloat32),
                m_ersHarvestedThisLapMGUH: parseNext(4, bd.getFloat32),
                m_ersDeployedThisLap: parseNext(4, bd.getFloat32),
                m_networkPaused: parseNext(1, bd.getUint8))));
    return packet;
  }
}
