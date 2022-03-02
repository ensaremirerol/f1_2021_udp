import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser_util.dart';
import 'package:f1_2021_udp/src/types/car_damage/car_damage.dart';
import 'package:f1_2021_udp/src/types/car_setups/car_setups.dart';
import 'package:f1_2021_udp/src/types/car_status/car_status.dart';
import 'package:f1_2021_udp/src/types/car_telemetry/car_telemetry.dart';
import 'package:f1_2021_udp/src/types/event/event.dart';
import 'package:f1_2021_udp/src/types/final_classification/final_classification.dart';
import 'package:f1_2021_udp/src/types/lap_data/lap_data.dart';
import 'package:f1_2021_udp/src/types/lobby_info/lobby_info.dart';
import 'package:f1_2021_udp/src/types/motion/motion.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import 'package:f1_2021_udp/src/types/participant/participant.dart';
import 'package:f1_2021_udp/src/types/session/session.dart';
import 'package:f1_2021_udp/src/types/session_history/session_history.dart';
import 'package:f1_2021_udp/src/types/types.dart';
import 'package:udp/udp.dart';
import 'package:logger/logger.dart';

class F12021TelemetryListener {
  static Logger _logger = Logger();

  late ReceivePort _port;

  final int port;

  Isolate? _isolate;

  final StreamController<Uint8List> _udpStream = StreamController.broadcast();

  final StreamController<PacketHeader> packetHeaderStream =
      StreamController.broadcast();

  final StreamController<PacketMotionData> packetMotionDataStream =
      StreamController.broadcast();

  final StreamController<PacketSessionData> packetSessionDataStream =
      StreamController.broadcast();

  final StreamController<PacketLapData> packetLapDataStream =
      StreamController.broadcast();

  final StreamController<PacketEventData> packetEventDataStream =
      StreamController.broadcast();

  final StreamController<PacketParticipantsData> packetParticipantsDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarSetupData> packetCarSetupDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarTelemetryData> packetCarTelemetryDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarStatusData> packetCarStatusDataStream =
      StreamController.broadcast();

  final StreamController<PacketFinalClassificationData>
      packetFinalClassificationDataStream = StreamController.broadcast();

  final StreamController<PacketLobbyInfoData> packetLobbyInfoDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarDamageData> packetCarDamageDataStream =
      StreamController.broadcast();

  final StreamController<PacketSessionHistoryData>
      packetSessionHistoryDataStream = StreamController.broadcast();

  F12021TelemetryListener(this.port) {
    _udpStream.stream.listen((event) {
      ParserUtil.getParsedData(event).then((header) {
        packetHeaderStream.add(header as PacketHeader);
        ParserUtil.getParsedData(event, header).then((fullPacket) {
          switch (Types.values[header.m_packetId]) {
            case Types.motion:
              packetMotionDataStream.add(fullPacket as PacketMotionData);
              break;
            case Types.session:
              packetSessionDataStream.add(fullPacket as PacketSessionData);
              break;
            case Types.lap_data:
              packetLapDataStream.add(fullPacket as PacketLapData);
              break;
            case Types.event:
              packetEventDataStream.add(fullPacket as PacketEventData);
              break;
            case Types.participants:
              packetParticipantsDataStream
                  .add(fullPacket as PacketParticipantsData);
              break;
            case Types.car_setups:
              packetCarSetupDataStream.add(fullPacket as PacketCarSetupData);
              break;
            case Types.car_telemetry:
              packetCarTelemetryDataStream
                  .add(fullPacket as PacketCarTelemetryData);
              break;
            case Types.car_status:
              packetCarStatusDataStream.add(fullPacket as PacketCarStatusData);
              break;
            case Types.final_classification:
              packetFinalClassificationDataStream
                  .add(fullPacket as PacketFinalClassificationData);
              break;
            case Types.lobby_info:
              packetLobbyInfoDataStream.add(fullPacket as PacketLobbyInfoData);
              break;
            case Types.car_damage:
              packetCarDamageDataStream.add(fullPacket as PacketCarDamageData);
              break;
            case Types.session_history:
              packetSessionHistoryDataStream
                  .add(fullPacket as PacketSessionHistoryData);
              break;
            case Types.unknown:
              _logger.e("Unknown packet type: ${header.m_packetId}");
              break;
          }
        });
      });
    });
  }

  /// Start listening for UDP packets
  void start() async {
    _port = ReceivePort();
    _isolate = await Isolate.spawn(
      _listenIsolate,
      [_port.sendPort, port],
    );
    _port.listen((message) {
      _udpStream.add(message);
    });
  }

  void close() {
    _isolate?.kill(priority: Isolate.immediate);
    _port.close();
    _udpStream.close();
  }

  /// Create an isolate that listens for UDP packets
  static void _listenIsolate(List<Object> args) async {
    final SendPort sendPort = args[0] as SendPort;
    final int port = args[1] as int;
    final UDP receiver = await UDP.bind(Endpoint.any(port: Port(port)));
    _logger.i('Listening on port $port');
    receiver.asStream().listen((event) {
      if (event != null) {
        sendPort.send(event.data);
      }
    });
  }
}
