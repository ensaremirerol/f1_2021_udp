import 'dart:typed_data';

import 'package:f1_2021_udp/src/types/packet_header.dart';

import 'package:logger/logger.dart';

abstract class Parser<T> {
  static const int HEADER_OFFSET = 24;
  int offset = 0;
  static final Logger _logger = Logger(
    level: Level.error,
  );
  T parse(Uint8List data, [PacketHeader? header]);

  void reset() {
    offset = 0;
  }

  dynamic parseNext(int length, Function parser) {
    try {
      offset += length;
      try {
        return parser(offset - length, Endian.little);
      } catch (e) {
        return parser(offset - length);
      }
    } catch (e) {
      _logger.e(
          "Error while parsing ${T.toString()}. Offset: $offset. Length: $length. Error: $e");
      return 0;
    }
  }

  Never packetHeaderRequired() {
    throw Exception('Packet header required');
  }
}
