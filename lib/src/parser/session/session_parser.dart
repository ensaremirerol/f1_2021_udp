/*
struct MarshalZone
{
    float  m_zoneStart;   // Fraction (0..1) of way through the lap the marshal zone starts
    int8   m_zoneFlag;    // -1 = invalid/unknown, 0 = none, 1 = green, 2 = blue, 3 = yellow, 4 = red
};
*/

/*
struct WeatherForecastSample
{
    uint8     m_sessionType;              // 0 = unknown, 1 = P1, 2 = P2, 3 = P3, 4 = Short P, 5 = Q1
                                          // 6 = Q2, 7 = Q3, 8 = Short Q, 9 = OSQ, 10 = R, 11 = R2
                                          // 12 = Time Trial
    uint8     m_timeOffset;               // Time in minutes the forecast is for
    uint8     m_weather;                  // Weather - 0 = clear, 1 = light cloud, 2 = overcast
                                          // 3 = light rain, 4 = heavy rain, 5 = storm
    int8      m_trackTemperature;         // Track temp. in degrees Celsius
    int8      m_trackTemperatureChange;   // Track temp. change – 0 = up, 1 = down, 2 = no change
    int8      m_airTemperature;           // Air temp. in degrees celsius
    int8      m_airTemperatureChange;     // Air temp. change – 0 = up, 1 = down, 2 = no change
    uint8     m_rainPercentage;           // Rain percentage (0-100)
};
*/

/*
struct PacketSessionData
{
    PacketHeader    m_header;               	// Header
    uint8           m_weather;              	// Weather - 0 = clear, 1 = light cloud, 2 = overcast
                                            	// 3 = light rain, 4 = heavy rain, 5 = storm
    int8	        m_trackTemperature;    	// Track temp. in degrees celsius
    int8	        m_airTemperature;      	// Air temp. in degrees celsius
    uint8           m_totalLaps;           	// Total number of laps in this race
    uint16          m_trackLength;           	// Track length in metres
    uint8           m_sessionType;         	// 0 = unknown, 1 = P1, 2 = P2, 3 = P3, 4 = Short P
                                            	// 5 = Q1, 6 = Q2, 7 = Q3, 8 = Short Q, 9 = OSQ
                                            	// 10 = R, 11 = R2, 12 = R3, 13 = Time Trial
    int8            m_trackId;         		// -1 for unknown, 0-21 for tracks, see appendix
    uint8           m_formula;                  	// Formula, 0 = F1 Modern, 1 = F1 Classic, 2 = F2,
                                                 // 3 = F1 Generic
    uint16          m_sessionTimeLeft;    	// Time left in session in seconds
    uint16          m_sessionDuration;     	// Session duration in seconds
    uint8           m_pitSpeedLimit;      	// Pit speed limit in kilometres per hour
    uint8           m_gamePaused;                // Whether the game is paused
    uint8           m_isSpectating;        	// Whether the player is spectating
    uint8           m_spectatorCarIndex;  	// Index of the car being spectated
    uint8           m_sliProNativeSupport;	// SLI Pro support, 0 = inactive, 1 = active
    uint8           m_numMarshalZones;         	// Number of marshal zones to follow
    MarshalZone     m_marshalZones[21];         	// List of marshal zones – max 21
    uint8           m_safetyCarStatus;           // 0 = no safety car, 1 = full
                                                 // 2 = virtual, 3 = formation lap
    uint8           m_networkGame;               // 0 = offline, 1 = online
    uint8           m_numWeatherForecastSamples; // Number of weather samples to follow
    WeatherForecastSample m_weatherForecastSamples[56];   // Array of weather forecast samples
    uint8           m_forecastAccuracy;          // 0 = Perfect, 1 = Approximate
    uint8           m_aiDifficulty;              // AI Difficulty rating – 0-110
    uint32          m_seasonLinkIdentifier;      // Identifier for season - persists across saves
    uint32          m_weekendLinkIdentifier;     // Identifier for weekend - persists across saves
    uint32          m_sessionLinkIdentifier;     // Identifier for session - persists across saves
    uint8           m_pitStopWindowIdealLap;     // Ideal lap to pit on for current strategy (player)
    uint8           m_pitStopWindowLatestLap;    // Latest lap to pit on for current strategy (player)
    uint8           m_pitStopRejoinPosition;     // Predicted position to rejoin at (player)
    uint8           m_steeringAssist;            // 0 = off, 1 = on
    uint8           m_brakingAssist;             // 0 = off, 1 = low, 2 = medium, 3 = high
    uint8           m_gearboxAssist;             // 1 = manual, 2 = manual & suggested gear, 3 = auto
    uint8           m_pitAssist;                 // 0 = off, 1 = on
    uint8           m_pitReleaseAssist;          // 0 = off, 1 = on
    uint8           m_ERSAssist;                 // 0 = off, 1 = on
    uint8           m_DRSAssist;                 // 0 = off, 1 = on
    uint8           m_dynamicRacingLine;         // 0 = off, 1 = corners only, 2 = full
    uint8           m_dynamicRacingLineType;     // 0 = 2D, 1 = 3D
};
*/

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import 'package:f1_2021_udp/src/types/session/session.dart';

class SessionParser extends Parser<PacketSessionData> {
  @override
  PacketSessionData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    final PacketSessionData packet = PacketSessionData(
        m_header: header!,
        m_weather: parseNext(1, bd.getUint8),
        m_trackTemperature: parseNext(1, bd.getInt8),
        m_airTemperature: parseNext(1, bd.getInt8),
        m_totalLaps: parseNext(1, bd.getUint8),
        m_trackLength: parseNext(2, bd.getUint16),
        m_sessionType: parseNext(1, bd.getUint8),
        m_trackId: parseNext(1, bd.getInt8),
        m_formula: parseNext(1, bd.getUint8),
        m_sessionTimeLeft: parseNext(2, bd.getUint16),
        m_sessionDuration: parseNext(2, bd.getUint16),
        m_pitSpeedLimit: parseNext(1, bd.getUint8),
        m_gamePaused: parseNext(1, bd.getUint8),
        m_isSpectating: parseNext(1, bd.getUint8),
        m_spectatorCarIndex: parseNext(1, bd.getUint8),
        m_sliProNativeSupport: parseNext(1, bd.getUint8),
        m_numMarshalZones: 0,
        m_marshalZones: List.generate(
            parseNext(1, bd.getUint8),
            (index) => MarshalZone(
                parseNext(4, bd.getFloat32), parseNext(1, bd.getInt8))),
        m_safetyCarStatus: parseNext(1, bd.getUint8),
        m_networkGame: parseNext(1, bd.getUint8),
        m_numWeatherForecastSamples: 0,
        m_weatherForecastSamples: List.generate(
            parseNext(1, bd.getUint8),
            (index) => WeatherForecastSample(
                  m_sessionType: parseNext(1, bd.getUint8),
                  m_timeOffset: parseNext(2, bd.getUint16),
                  m_weather: parseNext(1, bd.getUint8),
                  m_trackTemperature: parseNext(1, bd.getInt8),
                  m_trackTemperatureChange: parseNext(1, bd.getInt8),
                  m_airTemperature: parseNext(1, bd.getInt8),
                  m_airTemperatureChange: parseNext(1, bd.getInt8),
                  m_rainPercentage: parseNext(1, bd.getUint8),
                )),
        m_forecastAccuracy: parseNext(1, bd.getUint8),
        m_aiDifficulty: parseNext(1, bd.getUint8),
        m_seasonLinkIdentifier: parseNext(4, bd.getUint32),
        m_weekendLinkIdentifier: parseNext(4, bd.getUint32),
        m_sessionLinkIdentifier: parseNext(4, bd.getUint32),
        m_pitStopWindowIdealLap: parseNext(1, bd.getUint8),
        m_pitStopWindowLatestLap: parseNext(1, bd.getUint8),
        m_pitStopRejoinPosition: parseNext(1, bd.getUint8),
        m_steeringAssist: parseNext(1, bd.getUint8),
        m_brakingAssist: parseNext(1, bd.getUint8),
        m_gearboxAssist: parseNext(1, bd.getUint8),
        m_pitAssist: parseNext(1, bd.getUint8),
        m_pitReleaseAssist: parseNext(1, bd.getUint8),
        m_ERSAssist: parseNext(1, bd.getUint8),
        m_DRSAssist: parseNext(1, bd.getUint8),
        m_dynamicRacingLine: parseNext(1, bd.getUint8),
        m_dynamicRacingLineType: parseNext(1, bd.getUint8));
    packet.m_numMarshalZones = packet.m_marshalZones.length;
    packet.m_numWeatherForecastSamples = packet.m_weatherForecastSamples.length;
    return packet;
  }
}
