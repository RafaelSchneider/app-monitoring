import 'package:monitor_app/model/login_response.dart';

class DataChartBuilder{

  static Map<String, double> buildData(LoginResponse response){
    Map<String, double> _dataMap = new Map();
    _dataMap.putIfAbsent("Falha", () => response.quantidadeFalha);
    _dataMap.putIfAbsent("Negados", () => response.quantidadeNegado);
    _dataMap.putIfAbsent("Sucesso", () => response.quantidadeSucesso);
    return _dataMap;
  }
}