import 'dart:isolate';
import 'dart:typed_data';

import 'package:f1_2021_udp/src/parser/car_damage/car_damage_parser.dart';
import 'package:f1_2021_udp/src/parser/car_setups/car_setups_parser.dart';
import 'package:f1_2021_udp/src/parser/car_status/car_status_parser.dart';
import 'package:f1_2021_udp/src/parser/car_telemetry/car_telemetry_parser.dart';
import 'package:f1_2021_udp/src/parser/event/event_parser.dart';
import 'package:f1_2021_udp/src/parser/final_classification/final_classification_parser.dart';
import 'package:f1_2021_udp/src/parser/lap_data/lap_data_parser.dart';
import 'package:f1_2021_udp/src/parser/lobby_info/lobby_info.dart';
import 'package:f1_2021_udp/src/parser/motion/motion_parser.dart';
import 'package:f1_2021_udp/src/parser/packet_header_parser.dart';
import 'package:f1_2021_udp/src/parser/parser.dart';
import 'package:f1_2021_udp/src/parser/participant/participant_parser.dart';
import 'package:f1_2021_udp/src/parser/session/session_parser.dart';
import 'package:f1_2021_udp/src/parser/session_history/session_history_parser.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import 'package:logger/logger.dart';

const List<Type> all_parsers = [
  PacketHeaderParser,
  CarDamageDataParser,
  CarSetupsParser,
  CarStatusDataParser,
  CarTelemetryParser,
  EventParser,
  FinalClassificationParser,
  LapDataParser,
  LobbyInfoParser,
  MotionParser,
  ParticipantParser,
  SessionParser,
  SessionHistoryParser
];

class ParserUtil {
  static Logger _logger = Logger();
  /*

  Motion	0	Contains all motion data for player’s car – only sent while player is in control
  Session	1	Data about the session – track, time left
  Lap Data	2	Data about all the lap times of cars in the session
  Event	3	Various notable events that happen during a session
  Participants	4	List of participants in the session, mostly relevant for multiplayer
  Car Setups	5	Packet detailing car setups for cars in the race
  Car Telemetry	6	Telemetry data for all cars
  Car Status	7	Status data for all cars
  Final Classification	8	Final classification confirmation at the end of a race
  Lobby Info	9	Information about players in a multiplayer lobby
  Car Damage	10	Damage status for all cars
  Session History	11	Lap and tyre data for session
  */

  static Parser getParser(int packetType) {
    switch (packetType) {
      case 0:
        return MotionParser();
      case 1:
        return SessionParser();
      case 2:
        return LapDataParser();
      case 3:
        return EventParser();
      case 4:
        return ParticipantParser();
      case 5:
        return CarSetupsParser();
      case 6:
        return CarTelemetryParser();
      case 7:
        return CarStatusDataParser();
      case 8:
        return FinalClassificationParser();
      case 9:
        return LobbyInfoParser();
      case 10:
        return CarDamageDataParser();
      case 11:
        return SessionHistoryParser();
      default:
        return PacketHeaderParser();
    }
  }

  static Future<P> getParsedData<P>(Uint8List data,
      [PacketHeader? header]) async {
    final Parser parser = getParser(header?.m_packetId ?? 12);
    final ReceivePort receivePort = ReceivePort();
    Isolate.spawn(_isolate<P>, [receivePort.sendPort, data, parser, header]);
    return await receivePort.first;
  }

  static void _isolate<P>(List<Object?> args) {
    final SendPort sendPort = args[0] as SendPort;
    final Uint8List data = args[1] as Uint8List;
    final Parser parser = args[2] as Parser;
    final PacketHeader? header = args[3] as PacketHeader?;

    try {
      final P parsedData = parser.execute(data, header);
      Isolate.exit(sendPort, parsedData);
    } catch (e) {
      _logger.e(e);
      Isolate.exit(sendPort, null);
    }
  }
}
