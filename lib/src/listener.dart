import 'dart:async';
import 'dart:io';

import 'package:udp/udp.dart';

class Listener {
  late Endpoint endpoint;
  late UDP receiver;
  late StreamSubscription<Datagram?> subscription;
  void init() async {
    receiver = await UDP.bind(Endpoint.any(port: Port(20777)));
    print("He Ho!");
    subscription = receiver.asStream().listen((event) {
      print('Received: ${event?.data} from ${event?.address}');
    });
  }
}
