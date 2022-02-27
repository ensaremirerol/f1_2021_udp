import 'dart:async';
import 'dart:io';

import 'package:f1_2021_udp/src/listener.dart';
import 'package:f1_2021_udp/src/parser/car_telemetry/car_telemetry_parser.dart';
import 'package:f1_2021_udp/src/parser/packet_header_parser.dart';
import 'package:f1_2021_udp/src/types/car_telemetry/car_telemetry.dart';
import 'package:f1_2021_udp/src/types/packet_header.dart';
import 'package:f1_2021_udp/src/types/types.dart';
import 'package:udp/udp.dart';

void main() async {
  Listener listener = Listener();
  //listener.init();
  late Endpoint endpoint;
  late UDP receiver;
  late StreamSubscription<Datagram?> subscription;

  receiver = await UDP.bind(Endpoint.any(port: Port(20777)));
  print("He Ho!");
  subscription = receiver.asStream().listen((event) {
    if (event != null && event.data != null) {
      //print("Received: ${event.data.length} bytes");
      PacketHeader header = PacketHeaderParser().parse(event.data);
      if (Types.values[header.m_packetId] == Types.car_telemetry) {
        PacketCarTelemetryData data = CarTelemetryParser().parse(event.data);
        print(data.m_carTelemetryData[header.m_playerCarIndex]);
      }
      //print(header);
    }
  });
}
