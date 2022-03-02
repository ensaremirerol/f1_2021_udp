// ignore_for_file: non_constant_identifier_names

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
  /// World space X position
  final double m_worldPositionX;

  /// World space Y position
  final double m_worldPositionY;

  /// World space Z position
  final double m_worldPositionZ;

  /// Velocity in world space X
  final double m_worldVelocityX;

  /// Velocity in world space Y
  final double m_worldVelocityY;

  /// Velocity in world space Z
  final double m_worldVelocityZ;

  /// World space forward X direction (normalised)
  final int m_worldForwardDirX;

  /// World space forward Y direction (normalised)
  final int m_worldForwardDirY;

  /// World space forward Z direction (normalised)
  final int m_worldForwardDirZ;

  /// World space right X direction (normalised)
  final int m_worldRightDirX;

  /// World space right Y direction (normalised)
  final int m_worldRightDirY;

  /// World space right Z direction (normalised)
  final int m_worldRightDirZ;

  /// Lateral G-Force component
  final double m_gForceLateral;

  /// Longitudinal G-Force component
  final double m_gForceLongitudinal;

  /// Vertical G-Force component
  final double m_gForceVertical;

  /// Yaw angle in radians
  final double m_yaw;

  /// Pitch angle in radians
  final double m_pitch;

  /// Roll angle in radians
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

  /// Position of the suspension at the centre of the car in local space
  final List<double> m_suspensionPosition;

  /// Velocity of the suspension at the centre of the car in local space
  final List<double> m_suspensionVelocity;

  /// Acceleration of the suspension at the centre of the car in local space
  final List<double> m_suspensionAcceleration;

  /// Speed of each wheel
  final List<double> m_wheelSpeed;

  /// Slip ratio for each wheel
  final List<double> m_wheelSlip;

  /// Velocity in local space(X)
  final double m_localVelocityX;

  /// Velocity in local space(Y)
  final double m_localVelocityY;

  /// Velocity in local space(Z)
  final double m_localVelocityZ;

  /// Angular velocity x-component
  final double m_angularVelocityX;

  /// Angular velocity y-component
  final double m_angularVelocityY;

  /// Angular velocity z-component
  final double m_angularVelocityZ;

  /// Angular velocity x-component
  final double m_angularAccelerationX;

  /// Angular velocity y-component
  final double m_angularAccelerationY;

  /// Angular velocity z-component
  final double m_angularAccelerationZ;

  /// Current front wheels angle in radians
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
