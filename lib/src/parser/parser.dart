// ignore_for_file: constant_identifier_names

import 'dart:typed_data';

import 'package:f1_2021_udp/src/types/packet_header.dart';

import 'package:logger/logger.dart';

import 'package:meta/meta.dart';

abstract class Parser<T> {
  static const int HEADER_OFFSET = 24;
  static final Logger _logger = Logger(
    level: Level.error,
  );
  int _offset = 0;

  /// Parses the given [data] into a [T] object.
  /// If [T] is not [PacketHeader], header argument is required.
  T execute(Uint8List data, [PacketHeader? header]) {
    if (T != PacketHeader) {
      if (header == null) {
        _logger.e("Header is null");
        _packetHeaderRequired();
      }
      _offset = HEADER_OFFSET;
    }
    T result = parse(data, header);
    _reset();
    return result;
  }

  Type get type => T;

  /// [execute] method should be used! Parses the given [data] into a [T] object.
  @internal
  T parse(Uint8List data, [PacketHeader? header]);

  /// Should not used outside package! Calls [parser] function with current offset.
  @internal
  dynamic parseNext(int length, Function parser) {
    try {
      _offset += length;
      try {
        return parser(_offset - length, Endian.little);
      } catch (e) {
        return parser(_offset - length);
      }
    } catch (e) {
      _logger.e(
          "Error while parsing ${T.toString()}. Offset: $_offset. Length: $length. Error: $e");
      return 0;
    }
  }

  void _reset() {
    _offset = 0;
  }

  Never _packetHeaderRequired() {
    throw Exception('Packet header required');
  }
}
