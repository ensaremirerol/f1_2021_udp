// ignore_for_file: non_constant_identifier_names

/*
struct CarDamageData
{
    float     m_tyresWear[4];                     // Tyre wear (percentage)
    uint8     m_tyresDamage[4];                   // Tyre damage (percentage)
    uint8     m_brakesDamage[4];                  // Brakes damage (percentage)
    uint8     m_frontLeftWingDamage;              // Front left wing damage (percentage)
    uint8     m_frontRightWingDamage;             // Front right wing damage (percentage)
    uint8     m_rearWingDamage;                   // Rear wing damage (percentage)
    uint8     m_floorDamage;                      // Floor damage (percentage)
    uint8     m_diffuserDamage;                   // Diffuser damage (percentage)
    uint8     m_sidepodDamage;                    // Sidepod damage (percentage)
    uint8     m_drsFault;                         // Indicator for DRS fault, 0 = OK, 1 = fault
    uint8     m_gearBoxDamage;                    // Gear box damage (percentage)
    uint8     m_engineDamage;                     // Engine damage (percentage)
    uint8     m_engineMGUHWear;                   // Engine wear MGU-H (percentage)
    uint8     m_engineESWear;                     // Engine wear ES (percentage)
    uint8     m_engineCEWear;                     // Engine wear CE (percentage)
    uint8     m_engineICEWear;                    // Engine wear ICE (percentage)
    uint8     m_engineMGUKWear;                   // Engine wear MGU-K (percentage)
    uint8     m_engineTCWear;                     // Engine wear TC (percentage)
}
*/

import 'package:f1_2021_udp/src/types/packet_header.dart';

class CarDamageData {
  /// Tyre wear (percentage) [RL, RR, LF, RF]
  final List<double> m_tyresWear;

  /// Tyre damage (percentage) [RL, RR, LF, RF]
  final List<int> m_tyresDamage;

  /// Brakes damage (percentage) [RL, RR, LF, RF]
  final List<int> m_brakesDamage;

  /// Front left wing damage (percentage)
  final int m_frontLeftWingDamage;

  /// Front right wing damage (percentage)
  final int m_frontRightWingDamage;

  /// Rear wing damage (percentage)
  final int m_rearWingDamage;

  /// Floor damage (percentage)
  final int m_floorDamage;

  /// Diffuser damage (percentage)
  final int m_diffuserDamage;

  /// Sidepod damage (percentage)
  final int m_sidepodDamage;

  /// Indicator for DRS fault, 0 = OK, 1 = fault
  final int m_drsFault;

  /// Gear box damage (percentage)
  final int m_gearBoxDamage;

  /// Engine damage (percentage)
  final int m_engineDamage;

  /// Engine wear MGU-H (percentage)
  final int m_engineMGUHWear;

  /// Engine wear ES (percentage)
  final int m_engineESWear;

  /// Engine wear CE (percentage)
  final int m_engineCEWear;

  /// Engine wear ICE (percentage)
  final int m_engineICEWear;

  /// Engine wear MGU-K (percentage)
  final int m_engineMGUKWear;

  /// Engine wear TC (percentage)
  final int m_engineTCWear;

  const CarDamageData({
    required this.m_tyresWear,
    required this.m_tyresDamage,
    required this.m_brakesDamage,
    required this.m_frontLeftWingDamage,
    required this.m_frontRightWingDamage,
    required this.m_rearWingDamage,
    required this.m_floorDamage,
    required this.m_diffuserDamage,
    required this.m_sidepodDamage,
    required this.m_drsFault,
    required this.m_gearBoxDamage,
    required this.m_engineDamage,
    required this.m_engineMGUHWear,
    required this.m_engineESWear,
    required this.m_engineCEWear,
    required this.m_engineICEWear,
    required this.m_engineMGUKWear,
    required this.m_engineTCWear,
  });

  @override
  String toString() =>
      'CarDamageData { m_tyresWear: $m_tyresWear, m_tyresDamage: $m_tyresDamage, m_brakesDamage: $m_brakesDamage, m_frontLeftWingDamage: $m_frontLeftWingDamage, m_frontRightWingDamage: $m_frontRightWingDamage, m_rearWingDamage: $m_rearWingDamage, m_floorDamage: $m_floorDamage, m_diffuserDamage: $m_diffuserDamage, m_sidepodDamage: $m_sidepodDamage, m_drsFault: $m_drsFault, m_gearBoxDamage: $m_gearBoxDamage, m_engineDamage: $m_engineDamage, m_engineMGUHWear: $m_engineMGUHWear, m_engineESWear: $m_engineESWear, m_engineCEWear: $m_engineCEWear, m_engineICEWear: $m_engineICEWear, m_engineMGUKWear: $m_engineMGUKWear, m_engineTCWear: $m_engineTCWear }';
}

class PacketCarDamageData {
  final PacketHeader m_header;
  final List<CarDamageData> m_carDamageData;

  const PacketCarDamageData({
    required this.m_header,
    required this.m_carDamageData,
  });
}
