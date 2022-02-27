// ignore_for_file: non_constant_identifier_names

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

import 'package:f1_2021_udp/src/types/packet_header.dart';

class CarSetupData {
  final int m_frontWing;
  final int m_rearWing;
  final int m_onThrottle;
  final int m_offThrottle;
  final double m_frontCamber;
  final double m_rearCamber;
  final double m_frontToe;
  final double m_rearToe;
  final int m_frontSuspension;
  final int m_rearSuspension;
  final int m_frontAntiRollBar;
  final int m_rearAntiRollBar;
  final int m_frontSuspensionHeight;
  final int m_rearSuspensionHeight;
  final int m_brakePressure;
  final int m_brakeBias;
  final double m_rearLeftTyrePressure;
  final double m_rearRightTyrePressure;
  final double m_frontLeftTyrePressure;
  final double m_frontRightTyrePressure;
  final int m_ballast;
  final double m_fuelLoad;

  const CarSetupData({
    required this.m_frontWing,
    required this.m_rearWing,
    required this.m_onThrottle,
    required this.m_offThrottle,
    required this.m_frontCamber,
    required this.m_rearCamber,
    required this.m_frontToe,
    required this.m_rearToe,
    required this.m_frontSuspension,
    required this.m_rearSuspension,
    required this.m_frontAntiRollBar,
    required this.m_rearAntiRollBar,
    required this.m_frontSuspensionHeight,
    required this.m_rearSuspensionHeight,
    required this.m_brakePressure,
    required this.m_brakeBias,
    required this.m_rearLeftTyrePressure,
    required this.m_rearRightTyrePressure,
    required this.m_frontLeftTyrePressure,
    required this.m_frontRightTyrePressure,
    required this.m_ballast,
    required this.m_fuelLoad,
  });

  @override
  String toString() {
    return 'CarSetupData{m_frontWing: $m_frontWing, m_rearWing: $m_rearWing, m_onThrottle: $m_onThrottle, m_offThrottle: $m_offThrottle, m_frontCamber: $m_frontCamber, m_rearCamber: $m_rearCamber, m_frontToe: $m_frontToe, m_rearToe: $m_rearToe, m_frontSuspension: $m_frontSuspension, m_rearSuspension: $m_rearSuspension, m_frontAntiRollBar: $m_frontAntiRollBar, m_rearAntiRollBar: $m_rearAntiRollBar, m_frontSuspensionHeight: $m_frontSuspensionHeight, m_rearSuspensionHeight: $m_rearSuspensionHeight, m_brakePressure: $m_brakePressure, m_brakeBias: $m_brakeBias, m_rearLeftTyrePressure: $m_rearLeftTyrePressure, m_rearRightTyrePressure: $m_rearRightTyrePressure, m_frontLeftTyrePressure: $m_frontLeftTyrePressure, m_frontRightTyrePressure: $m_frontRightTyrePressure, m_ballast: $m_ballast, m_fuelLoad: $m_fuelLoad}';
  }
}

class PacketCarSetupData {
  final PacketHeader m_header;
  final List<CarSetupData> m_carSetupData;

  const PacketCarSetupData({
    required this.m_header,
    required this.m_carSetupData,
  });
}
