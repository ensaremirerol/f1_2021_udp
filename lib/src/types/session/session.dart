/*
struct MarshalZone
{
    float  m_zoneStart;   // Fraction (0..1) of way through the lap the marshal zone starts
    int8   m_zoneFlag;    // -1 = invalid/unknown, 0 = none, 1 = green, 2 = blue, 3 = yellow, 4 = red
};
*/

import 'package:f1_2021_udp/src/types/packet_header.dart';

class MarshalZone {
  final double m_zoneStart;
  final int m_zoneFlag;

  const MarshalZone(this.m_zoneStart, this.m_zoneFlag);
}

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

class WeatherForecastSample {
  final int m_sessionType;
  final int m_timeOffset;
  final int m_weather;
  final int m_trackTemperature;
  final int m_trackTemperatureChange;
  final int m_airTemperature;
  final int m_airTemperatureChange;
  final int m_rainPercentage;

  const WeatherForecastSample(
      {required this.m_sessionType,
      required this.m_timeOffset,
      required this.m_weather,
      required this.m_trackTemperature,
      required this.m_trackTemperatureChange,
      required this.m_airTemperature,
      required this.m_airTemperatureChange,
      required this.m_rainPercentage});
}

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

class PacketSessionData {
  final PacketHeader m_header;
  final int m_weather;
  final int m_trackTemperature;
  final int m_airTemperature;
  final int m_totalLaps;
  final int m_trackLength;
  final int m_sessionType;
  final int m_trackId;
  final int m_formula;
  final int m_sessionTimeLeft;
  final int m_sessionDuration;
  final int m_pitSpeedLimit;
  final int m_gamePaused;
  final int m_isSpectating;
  final int m_spectatorCarIndex;
  final int m_sliProNativeSupport;
  final int m_numMarshalZones;
  final List<MarshalZone> m_marshalZones;
  final int m_safetyCarStatus;
  final int m_networkGame;
  final int m_numWeatherForecastSamples;
  final List<WeatherForecastSample> m_weatherForecastSamples;
  final int m_forecastAccuracy;
  final int m_aiDifficulty;
  final int m_seasonLinkIdentifier;
  final int m_weekendLinkIdentifier;
  final int m_sessionLinkIdentifier;
  final int m_pitStopWindowIdealLap;
  final int m_pitStopWindowLatestLap;
  final int m_pitStopRejoinPosition;
  final int m_steeringAssist;
  final int m_brakingAssist;
  final int m_gearboxAssist;
  final int m_pitAssist;
  final int m_pitReleaseAssist;
  final int m_ERSAssist;
  final int m_DRSAssist;
  final int m_dynamicRacingLine;
  final int m_dynamicRacingLineType;

  const PacketSessionData({
    required this.m_header,
    required this.m_weather,
    required this.m_trackTemperature,
    required this.m_airTemperature,
    required this.m_totalLaps,
    required this.m_trackLength,
    required this.m_sessionType,
    required this.m_trackId,
    required this.m_formula,
    required this.m_sessionTimeLeft,
    required this.m_sessionDuration,
    required this.m_pitSpeedLimit,
    required this.m_gamePaused,
    required this.m_isSpectating,
    required this.m_spectatorCarIndex,
    required this.m_sliProNativeSupport,
    required this.m_numMarshalZones,
    required this.m_marshalZones,
    required this.m_safetyCarStatus,
    required this.m_networkGame,
    required this.m_numWeatherForecastSamples,
    required this.m_weatherForecastSamples,
    required this.m_forecastAccuracy,
    required this.m_aiDifficulty,
    required this.m_seasonLinkIdentifier,
    required this.m_weekendLinkIdentifier,
    required this.m_sessionLinkIdentifier,
    required this.m_pitStopWindowIdealLap,
    required this.m_pitStopWindowLatestLap,
    required this.m_pitStopRejoinPosition,
    required this.m_steeringAssist,
    required this.m_brakingAssist,
    required this.m_gearboxAssist,
    required this.m_pitAssist,
    required this.m_pitReleaseAssist,
    required this.m_ERSAssist,
    required this.m_DRSAssist,
    required this.m_dynamicRacingLine,
    required this.m_dynamicRacingLineType,
  });
}
