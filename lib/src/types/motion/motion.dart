/*
struct CarMotionData
{
    float         m_worldPositionX;           // World space X position
    float         m_worldPositionY;           // World space Y position
    float         m_worldPositionZ;           // World space Z position
    float         m_worldVelocityX;           // Velocity in world space X
    float         m_worldVelocityY;           // Velocity in world space Y
    float         m_worldVelocityZ;           // Velocity in world space Z
    int16         m_worldForwardDirX;         // World space forward X direction (normalised)
    int16         m_worldForwardDirY;         // World space forward Y direction (normalised)
    int16         m_worldForwardDirZ;         // World space forward Z direction (normalised)
    int16         m_worldRightDirX;           // World space right X direction (normalised)
    int16         m_worldRightDirY;           // World space right Y direction (normalised)
    int16         m_worldRightDirZ;           // World space right Z direction (normalised)
    float         m_gForceLateral;            // Lateral G-Force component
    float         m_gForceLongitudinal;       // Longitudinal G-Force component
    float         m_gForceVertical;           // Vertical G-Force component
    float         m_yaw;                      // Yaw angle in radians
    float         m_pitch;                    // Pitch angle in radians
    float         m_roll;                     // Roll angle in radians
};
*/

import 'package:f1_2021_udp/src/types/packet_header.dart';

class CarMotionData {
  final double m_worldPositionX;
  final double m_worldPositionY;
  final double m_worldPositionZ;
  final double m_worldVelocityX;
  final double m_worldVelocityY;
  final double m_worldVelocityZ;
  final int m_worldForwardDirX;
  final int m_worldForwardDirY;
  final int m_worldForwardDirZ;
  final int m_worldRightDirX;
  final int m_worldRightDirY;
  final int m_worldRightDirZ;
  final double m_gForceLateral;
  final double m_gForceLongitudinal;
  final double m_gForceVertical;
  final double m_yaw;
  final double m_pitch;
  final double m_roll;

  const CarMotionData({
    required this.m_worldPositionX,
    required this.m_worldPositionY,
    required this.m_worldPositionZ,
    required this.m_worldVelocityX,
    required this.m_worldVelocityY,
    required this.m_worldVelocityZ,
    required this.m_worldForwardDirX,
    required this.m_worldForwardDirY,
    required this.m_worldForwardDirZ,
    required this.m_worldRightDirX,
    required this.m_worldRightDirY,
    required this.m_worldRightDirZ,
    required this.m_gForceLateral,
    required this.m_gForceLongitudinal,
    required this.m_gForceVertical,
    required this.m_yaw,
    required this.m_pitch,
    required this.m_roll,
  });

  @override
  String toString() {
    return 'CarMotionData{m_worldPositionX: $m_worldPositionX, m_worldPositionY: $m_worldPositionY, m_worldPositionZ: $m_worldPositionZ, m_worldVelocityX: $m_worldVelocityX, m_worldVelocityY: $m_worldVelocityY, m_worldVelocityZ: $m_worldVelocityZ, m_worldForwardDirX: $m_worldForwardDirX, m_worldForwardDirY: $m_worldForwardDirY, m_worldForwardDirZ: $m_worldForwardDirZ, m_worldRightDirX: $m_worldRightDirX, m_worldRightDirY: $m_worldRightDirY, m_worldRightDirZ: $m_worldRightDirZ, m_gForceLateral: $m_gForceLateral, m_gForceLongitudinal: $m_gForceLongitudinal, m_gForceVertical: $m_gForceVertical, m_yaw: $m_yaw, m_pitch: $m_pitch, m_roll: $m_roll}';
  }
}

/*
struct PacketMotionData
{
    PacketHeader    m_header;               	// Header
    CarMotionData   m_carMotionData:[22];    	// Data for all cars on track
                                                // Extra player car ONLY data
    float         m_suspensionPosition[4];       // Note: All wheel arrays have the following order:
    float         m_suspensionVelocity[4];       // RL, RR, FL, FR
    float         m_suspensionAcceleration[4];	// RL, RR, FL, FR
    float         m_wheelSpeed[4];           	// Speed of each wheel
    float         m_wheelSlip[4];                // Slip ratio for each wheel
    float         m_localVelocityX;         	// Velocity in local space
    float         m_localVelocityY;         	// Velocity in local space
    float         m_localVelocityZ;         	// Velocity in local space
    float         m_angularVelocityX;	     	// Angular velocity x-component
    float         m_angularVelocityY;            // Angular velocity y-component
    float         m_angularVelocityZ;            // Angular velocity z-component
    float         m_angularAccelerationX;        // Angular velocity x-component
    float         m_angularAccelerationY;	     // Angular velocity y-component
    float         m_angularAccelerationZ;        // Angular velocity z-component
    float         m_frontWheelsAngle;            // Current front wheels angle in radians
};
*/

class PacketMotionData {
  final PacketHeader m_header;
  final List<CarMotionData> m_carMotionData;
  final List<double> m_suspensionPosition;
  final List<double> m_suspensionVelocity;
  final List<double> m_suspensionAcceleration;
  final List<double> m_wheelSpeed;
  final List<double> m_wheelSlip;
  final double m_localVelocityX;
  final double m_localVelocityY;
  final double m_localVelocityZ;
  final double m_angularVelocityX;
  final double m_angularVelocityY;
  final double m_angularVelocityZ;
  final double m_angularAccelerationX;
  final double m_angularAccelerationY;
  final double m_angularAccelerationZ;
  final double m_frontWheelsAngle;

  const PacketMotionData({
    required this.m_header,
    required this.m_carMotionData,
    required this.m_suspensionPosition,
    required this.m_suspensionVelocity,
    required this.m_suspensionAcceleration,
    required this.m_wheelSpeed,
    required this.m_wheelSlip,
    required this.m_localVelocityX,
    required this.m_localVelocityY,
    required this.m_localVelocityZ,
    required this.m_angularVelocityX,
    required this.m_angularVelocityY,
    required this.m_angularVelocityZ,
    required this.m_angularAccelerationX,
    required this.m_angularAccelerationY,
    required this.m_angularAccelerationZ,
    required this.m_frontWheelsAngle,
  });
}
