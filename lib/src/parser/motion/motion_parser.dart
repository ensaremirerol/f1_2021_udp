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

import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/types/motion/motion.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';

class MotionParser extends Parser<PacketMotionData> {
  @override
  PacketMotionData parse(Uint8List data, [PacketHeader? header]) {
    final ByteData bd = ByteData.view(data.buffer);
    final PacketMotionData packet = PacketMotionData(
        m_header: header!,
        m_carMotionData: List.generate(
            22,
            (index) => CarMotionData(
                m_worldPositionX: parseNext(4, bd.getFloat32),
                m_worldPositionY: parseNext(4, bd.getFloat32),
                m_worldPositionZ: parseNext(4, bd.getFloat32),
                m_worldVelocityX: parseNext(4, bd.getFloat32),
                m_worldVelocityY: parseNext(4, bd.getFloat32),
                m_worldVelocityZ: parseNext(4, bd.getFloat32),
                m_worldForwardDirX: parseNext(2, bd.getInt16),
                m_worldForwardDirY: parseNext(2, bd.getInt16),
                m_worldForwardDirZ: parseNext(2, bd.getInt16),
                m_worldRightDirX: parseNext(2, bd.getInt16),
                m_worldRightDirY: parseNext(2, bd.getInt16),
                m_worldRightDirZ: parseNext(2, bd.getInt16),
                m_gForceLateral: parseNext(4, bd.getFloat32),
                m_gForceLongitudinal: parseNext(4, bd.getFloat32),
                m_gForceVertical: parseNext(4, bd.getFloat32),
                m_yaw: parseNext(4, bd.getFloat32),
                m_pitch: parseNext(4, bd.getFloat32),
                m_roll: parseNext(4, bd.getFloat32))),
        m_suspensionPosition:
            List.generate(4, (index) => parseNext(4, bd.getFloat32)),
        m_suspensionVelocity:
            List.generate(4, (index) => parseNext(4, bd.getFloat32)),
        m_suspensionAcceleration:
            List.generate(4, (index) => parseNext(4, bd.getFloat32)),
        m_wheelSpeed: List.generate(4, (index) => parseNext(4, bd.getFloat32)),
        m_wheelSlip: List.generate(4, (index) => parseNext(4, bd.getFloat32)),
        m_localVelocityX: parseNext(4, bd.getFloat32),
        m_localVelocityY: parseNext(4, bd.getFloat32),
        m_localVelocityZ: parseNext(4, bd.getFloat32),
        m_angularVelocityX: parseNext(4, bd.getFloat32),
        m_angularVelocityY: parseNext(4, bd.getFloat32),
        m_angularVelocityZ: parseNext(4, bd.getFloat32),
        m_angularAccelerationX: parseNext(4, bd.getFloat32),
        m_angularAccelerationY: parseNext(4, bd.getFloat32),
        m_angularAccelerationZ: parseNext(4, bd.getFloat32),
        m_frontWheelsAngle: parseNext(4, bd.getFloat32));
    return packet;
  }
}
