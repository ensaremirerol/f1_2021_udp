import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/car_telemetry/car_telemetry.dart';

/*
struct CarTelemetryData
{
    uint16    m_speed;                    // Speed of car in kilometres per hour
    float     m_throttle;                 // Amount of throttle applied (0.0 to 1.0)
    float     m_steer;                    // Steering (-1.0 (full lock left) to 1.0 (full lock right))
    float     m_brake;                    // Amount of brake applied (0.0 to 1.0)
    uint8     m_clutch;                   // Amount of clutch applied (0 to 100)
    int8      m_gear;                     // Gear selected (1-8, N=0, R=-1)
    uint16    m_engineRPM;                // Engine RPM
    uint8     m_drs;                      // 0 = off, 1 = on
    uint8     m_revLightsPercent;         // Rev lights indicator (percentage)
    uint16    m_revLightsBitValue;        // Rev lights (bit 0 = leftmost LED, bit 14 = rightmost LED)
    uint16    m_brakesTemperature[4];     // Brakes temperature (celsius)
    uint8     m_tyresSurfaceTemperature[4]; // Tyres surface temperature (celsius)
    uint8     m_tyresInnerTemperature[4]; // Tyres inner temperature (celsius)
    uint16    m_engineTemperature;        // Engine temperature (celsius)
    float     m_tyresPressure[4];         // Tyres pressure (PSI)
    uint8     m_surfaceType[4];           // Driving surface, see appendices
};
*/

/*
struct PacketCarTelemetryData
{
    PacketHeader    	m_header;	      // Header
    CarTelemetryData    m_carTelemetryData[22];
    uint8               m_mfdPanelIndex;       // Index of MFD panel open - 255 = MFD closed
                                               // Single player, race – 0 = Car setup, 1 = Pits
                                               // 2 = Damage, 3 =  Engine, 4 = Temperatures
                                               // May vary depending on game mode
    uint8               m_mfdPanelIndexSecondaryPlayer;   // See above
    int8                m_suggestedGear;       // Suggested gear for the player (1-8)
                                               // 0 if no gear suggested
};
*/

class CarTelemetryParser extends Parser<PacketCarTelemetryData> {
  @override
  PacketCarTelemetryData parse(Uint8List data) {
    offset = 24;
    final ByteData bd = ByteData.view(data.buffer);
    PacketCarTelemetryData packet = PacketCarTelemetryData(
      m_header: Parser.currentHeader!,
      m_carTelemetryData: List<CarTelemetryData>.generate(
        22,
        (i) => CarTelemetryData(
          m_speed: parseNext(2, bd.getUint16),
          m_throttle: parseNext(4, bd.getFloat32),
          m_steer: parseNext(4, bd.getFloat32),
          m_brake: parseNext(4, bd.getFloat32),
          m_clutch: parseNext(1, bd.getUint8),
          m_gear: parseNext(1, bd.getInt8),
          m_engineRPM: parseNext(2, bd.getUint16),
          m_drs: parseNext(1, bd.getUint8),
          m_revLightsPercent: parseNext(1, bd.getUint8),
          m_revLightsBitValue: parseNext(2, bd.getUint16),
          m_brakesTemperature:
              List<int>.generate(4, (i) => parseNext(2, bd.getUint16)),
          m_tyresSurfaceTemperature:
              List<int>.generate(4, (i) => parseNext(1, bd.getUint8)),
          m_tyresInnerTemperature:
              List<int>.generate(4, (i) => parseNext(1, bd.getUint8)),
          m_engineTemperature: parseNext(2, bd.getUint16),
          m_tyresPressure:
              List<double>.generate(4, (i) => parseNext(4, bd.getFloat32)),
          m_surfaceType:
              List<int>.generate(4, (i) => parseNext(1, bd.getUint8)),
        ),
      ),
      m_mfdPanelIndex: parseNext(1, bd.getUint8),
      m_mfdPanelIndexSecondaryPlayer: parseNext(1, bd.getUint8),
      m_suggestedGear: parseNext(1, bd.getInt8),
    );
    reset();
    return packet;
  }
}
