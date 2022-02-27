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
  final List<double> m_tyresWear;
  final List<int> m_tyresDamage;
  final List<int> m_brakesDamage;
  final int m_frontLeftWingDamage;
  final int m_frontRightWingDamage;
  final int m_rearWingDamage;
  final int m_floorDamage;
  final int m_diffuserDamage;
  final int m_sidepodDamage;
  final int m_drsFault;
  final int m_gearBoxDamage;
  final int m_engineDamage;
  final int m_engineMGUHWear;
  final int m_engineESWear;
  final int m_engineCEWear;
  final int m_engineICEWear;
  final int m_engineMGUKWear;
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
