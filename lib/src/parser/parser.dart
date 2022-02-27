import 'dart:typed_data';

import 'package:f1_2021_udp/src/types/packet_header.dart';

abstract class Parser<T> {
  static PacketHeader? currentHeader;

  int offset = 0;

  T parse(Uint8List data);

  void reset() {
    offset = 0;
  }

  dynamic parseNext(int length, Function parser) {
    offset += length;
    try {
      return parser(offset - length, Endian.little);
    } catch (e) {
      return parser(offset - length);
    }
  }
}
