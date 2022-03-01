/*
struct CarSetupData
{
    uint8     m_frontWing;                // Front wing aero
    uint8     m_rearWing;                 // Rear wing aero
    uint8     m_onThrottle;               // Differential adjustment on throttle (percentage)
    uint8     m_offThrottle;              // Differential adjustment off throttle (percentage)
    float     m_frontCamber;              // Front camber angle (suspension geometry)
    float     m_rearCamber;               // Rear camber angle (suspension geometry)
    float     m_frontToe;                 // Front toe angle (suspension geometry)
    float     m_rearToe;                  // Rear toe angle (suspension geometry)
    uint8     m_frontSuspension;          // Front suspension
    uint8     m_rearSuspension;           // Rear suspension
    uint8     m_frontAntiRollBar;         // Front anti-roll bar
    uint8     m_rearAntiRollBar;          // Front anti-roll bar
    uint8     m_frontSuspensionHeight;    // Front ride height
    uint8     m_rearSuspensionHeight;     // Rear ride height
    uint8     m_brakePressure;            // Brake pressure (percentage)
    uint8     m_brakeBias;                // Brake bias (percentage)
    float     m_rearLeftTyrePressure;     // Rear left tyre pressure (PSI)
    float     m_rearRightTyrePressure;    // Rear right tyre pressure (PSI)
    float     m_frontLeftTyrePressure;    // Front left tyre pressure (PSI)
    float     m_frontRightTyrePressure;   // Front right tyre pressure (PSI)
    uint8     m_ballast;                  // Ballast
    float     m_fuelLoad;                 // Fuel load
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/car_setups/car_setups.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';

class CarSetupsParser extends Parser<PacketCarSetupData> {
  @override
  PacketCarSetupData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    final PacketCarSetupData packet = PacketCarSetupData(
        m_header: header!,
        m_carSetupData: List.generate(
            22,
            (index) => CarSetupData(
                m_frontWing: parseNext(1, bd.getUint8),
                m_rearWing: parseNext(1, bd.getUint8),
                m_onThrottle: parseNext(1, bd.getUint8),
                m_offThrottle: parseNext(1, bd.getUint8),
                m_frontCamber: parseNext(4, bd.getFloat32),
                m_rearCamber: parseNext(4, bd.getFloat32),
                m_frontToe: parseNext(4, bd.getFloat32),
                m_rearToe: parseNext(4, bd.getFloat32),
                m_frontSuspension: parseNext(1, bd.getUint8),
                m_rearSuspension: parseNext(1, bd.getUint8),
                m_frontAntiRollBar: parseNext(1, bd.getUint8),
                m_rearAntiRollBar: parseNext(1, bd.getUint8),
                m_frontSuspensionHeight: parseNext(1, bd.getUint8),
                m_rearSuspensionHeight: parseNext(1, bd.getUint8),
                m_brakePressure: parseNext(1, bd.getUint8),
                m_brakeBias: parseNext(1, bd.getUint8),
                m_rearLeftTyrePressure: parseNext(4, bd.getFloat32),
                m_rearRightTyrePressure: parseNext(4, bd.getFloat32),
                m_frontLeftTyrePressure: parseNext(4, bd.getFloat32),
                m_frontRightTyrePressure: parseNext(4, bd.getFloat32),
                m_ballast: parseNext(1, bd.getUint8),
                m_fuelLoad: parseNext(4, bd.getFloat32))));
    return packet;
  }
}
