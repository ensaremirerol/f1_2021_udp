// ignore_for_file: file_names

import 'dart:async';
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
  static final Logger _logger = Logger();

  late ReceivePort _port;

  final int port;

  Isolate? _isolate;

  final StreamController<Uint8List> _udpStream = StreamController.broadcast();

  final StreamController<PacketHeader> _packetHeaderStream =
      StreamController.broadcast();

  final StreamController<PacketMotionData> _packetMotionDataStream =
      StreamController.broadcast();

  final StreamController<PacketSessionData> _packetSessionDataStream =
      StreamController.broadcast();

  final StreamController<PacketLapData> _packetLapDataStream =
      StreamController.broadcast();

  final StreamController<PacketEventData> _packetEventDataStream =
      StreamController.broadcast();

  final StreamController<PacketParticipantsData> _packetParticipantsDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarSetupData> _packetCarSetupDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarTelemetryData> _packetCarTelemetryDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarStatusData> _packetCarStatusDataStream =
      StreamController.broadcast();

  final StreamController<PacketFinalClassificationData>
      _packetFinalClassificationDataStream = StreamController.broadcast();

  final StreamController<PacketLobbyInfoData> _packetLobbyInfoDataStream =
      StreamController.broadcast();

  final StreamController<PacketCarDamageData> _packetCarDamageDataStream =
      StreamController.broadcast();

  final StreamController<PacketSessionHistoryData>
      _packetSessionHistoryDataStream = StreamController.broadcast();

  /// Stream of all UDP packets' headers
  Stream<PacketHeader> get packetHeaderStream => _packetHeaderStream.stream;

  /// Stream of all UDP packets' motion data
  Stream<PacketMotionData> get packetMotionDataStream =>
      _packetMotionDataStream.stream;

  /// Stream of all UDP packets' session data
  Stream<PacketSessionData> get packetSessionDataStream =>
      _packetSessionDataStream.stream;

  /// Stream of all UDP packets' lap data
  Stream<PacketLapData> get packetLapDataStream => _packetLapDataStream.stream;

  /// Stream of all UDP packets' event data
  Stream<PacketEventData> get packetEventDataStream =>
      _packetEventDataStream.stream;

  /// Stream of all UDP packets' participants data
  Stream<PacketParticipantsData> get packetParticipantsDataStream =>
      _packetParticipantsDataStream.stream;

  /// Stream of all UDP packets' car setup data
  Stream<PacketCarSetupData> get packetCarSetupDataStream =>
      _packetCarSetupDataStream.stream;

  /// Stream of all UDP packets' car telemetry data
  Stream<PacketCarTelemetryData> get packetCarTelemetryDataStream =>
      _packetCarTelemetryDataStream.stream;

  /// Stream of all UDP packets' car status data
  Stream<PacketCarStatusData> get packetCarStatusDataStream =>
      _packetCarStatusDataStream.stream;

  /// Stream of all UDP packets' final classification data
  Stream<PacketFinalClassificationData>
      get packetFinalClassificationDataStream =>
          _packetFinalClassificationDataStream.stream;

  /// Stream of all UDP packets' lobby info data
  Stream<PacketLobbyInfoData> get packetLobbyInfoDataStream =>
      _packetLobbyInfoDataStream.stream;

  /// Stream of all UDP packets' car damage data
  Stream<PacketCarDamageData> get packetCarDamageDataStream =>
      _packetCarDamageDataStream.stream;

  /// Stream of all UDP packets' session history data
  Stream<PacketSessionHistoryData> get packetSessionHistoryDataStream =>
      _packetSessionHistoryDataStream.stream;

  F12021TelemetryListener(this.port) {
    _udpStream.stream.listen((event) {
      ParserUtil.getParsedData(event).then((header) {
        _packetHeaderStream.add(header as PacketHeader);
        ParserUtil.getParsedData(event, header).then((fullPacket) {
          switch (Types.values[header.m_packetId]) {
            case Types.motion:
              _packetMotionDataStream.add(fullPacket as PacketMotionData);
              break;
            case Types.session:
              _packetSessionDataStream.add(fullPacket as PacketSessionData);
              break;
            case Types.lap_data:
              _packetLapDataStream.add(fullPacket as PacketLapData);
              break;
            case Types.event:
              _packetEventDataStream.add(fullPacket as PacketEventData);
              break;
            case Types.participants:
              _packetParticipantsDataStream
                  .add(fullPacket as PacketParticipantsData);
              break;
            case Types.car_setups:
              _packetCarSetupDataStream.add(fullPacket as PacketCarSetupData);
              break;
            case Types.car_telemetry:
              _packetCarTelemetryDataStream
                  .add(fullPacket as PacketCarTelemetryData);
              break;
            case Types.car_status:
              _packetCarStatusDataStream.add(fullPacket as PacketCarStatusData);
              break;
            case Types.final_classification:
              _packetFinalClassificationDataStream
                  .add(fullPacket as PacketFinalClassificationData);
              break;
            case Types.lobby_info:
              _packetLobbyInfoDataStream.add(fullPacket as PacketLobbyInfoData);
              break;
            case Types.car_damage:
              _packetCarDamageDataStream.add(fullPacket as PacketCarDamageData);
              break;
            case Types.session_history:
              _packetSessionHistoryDataStream
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
