import 'package:monitor_app/client/client.dart';


class MonitorService {

  Future<Map<String, double>> getLoginsData() {
    MonitorApi client = MonitorApi();
    return client.getLogin();
  }

}