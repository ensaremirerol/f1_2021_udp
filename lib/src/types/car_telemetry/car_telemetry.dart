// ignore_for_file: non_constant_identifier_names

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

import 'package:f1_2021_udp/src/types/packet_header.dart';

class CarTelemetryData {
  int m_speed;
  double m_throttle;
  double m_steer;
  double m_brake;
  int m_clutch;
  int m_gear;
  int m_engineRPM;
  int m_drs;
  int m_revLightsPercent;
  int m_revLightsBitValue;
  List<int> m_brakesTemperature;
  List<int> m_tyresSurfaceTemperature;
  List<int> m_tyresInnerTemperature;
  int m_engineTemperature;
  List<double> m_tyresPressure;
  List<int> m_surfaceType;

  CarTelemetryData({
    required this.m_speed,
    required this.m_throttle,
    required this.m_steer,
    required this.m_brake,
    required this.m_clutch,
    required this.m_gear,
    required this.m_engineRPM,
    required this.m_drs,
    required this.m_revLightsPercent,
    required this.m_revLightsBitValue,
    required this.m_brakesTemperature,
    required this.m_tyresSurfaceTemperature,
    required this.m_tyresInnerTemperature,
    required this.m_engineTemperature,
    required this.m_tyresPressure,
    required this.m_surfaceType,
  });

  @override
  String toString() {
    return 'CarTelemetryData{m_speed: $m_speed, m_throttle: $m_throttle, m_steer: $m_steer, m_brake: $m_brake, m_clutch: $m_clutch, m_gear: $m_gear, m_engineRPM: $m_engineRPM, m_drs: $m_drs, m_revLightsPercent: $m_revLightsPercent, m_revLightsBitValue: $m_revLightsBitValue, m_brakesTemperature: $m_brakesTemperature, m_tyresSurfaceTemperature: $m_tyresSurfaceTemperature, m_tyresInnerTemperature: $m_tyresInnerTemperature, m_engineTemperature: $m_engineTemperature, m_tyresPressure: $m_tyresPressure, m_surfaceType: $m_surfaceType}';
  }
}

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

class PacketCarTelemetryData {
  final PacketHeader m_header;
  final List<CarTelemetryData> m_carTelemetryData;
  final int m_mfdPanelIndex;
  final int m_mfdPanelIndexSecondaryPlayer;
  final int m_suggestedGear;

  PacketCarTelemetryData({
    required this.m_header,
    required this.m_carTelemetryData,
    required this.m_mfdPanelIndex,
    required this.m_mfdPanelIndexSecondaryPlayer,
    required this.m_suggestedGear,
  });
}
