# f1_2021_udp

Package for listening Telemetry data from F1 2021 game.

## Example

```
import 'package:f1_2021_udp/src/F1_2021_telemery_listener.dart';

void main() async {
  F12021TelemetryListener listener = F12021TelemetryListener(20777);
  listener.start();
  listener.packetCarTelemetryDataStream.listen((packet) {
    print(packet.m_carTelemetryData[0].toString());
  });
}
```
