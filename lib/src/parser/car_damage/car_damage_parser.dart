import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/car_damage/car_damage.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
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

class CarDamageDataParser extends Parser<PacketCarDamageData> {
  @override
  PacketCarDamageData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    final PacketCarDamageData packet = PacketCarDamageData(
        m_header: header!,
        m_carDamageData: List.generate(
            22,
            (index) => CarDamageData(
                m_tyresWear:
                    List.generate(4, (index) => parseNext(4, bd.getFloat32)),
                m_tyresDamage:
                    List.generate(4, (index) => parseNext(1, bd.getUint8)),
                m_brakesDamage:
                    List.generate(4, (index) => parseNext(1, bd.getUint8)),
                m_frontLeftWingDamage: parseNext(1, bd.getUint8),
                m_frontRightWingDamage: parseNext(1, bd.getUint8),
                m_rearWingDamage: parseNext(1, bd.getUint8),
                m_floorDamage: parseNext(1, bd.getUint8),
                m_diffuserDamage: parseNext(1, bd.getUint8),
                m_sidepodDamage: parseNext(1, bd.getUint8),
                m_drsFault: parseNext(1, bd.getUint8),
                m_gearBoxDamage: parseNext(1, bd.getUint8),
                m_engineDamage: parseNext(1, bd.getUint8),
                m_engineMGUHWear: parseNext(1, bd.getUint8),
                m_engineESWear: parseNext(1, bd.getUint8),
                m_engineCEWear: parseNext(1, bd.getUint8),
                m_engineICEWear: parseNext(1, bd.getUint8),
                m_engineMGUKWear: parseNext(1, bd.getUint8),
                m_engineTCWear: parseNext(1, bd.getUint8))));
    return packet;
  }
}
