import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class MonitorApi {

  Future<Map<String, double>> getLogin() async {
    final _endpoint = "http://10.0.2.2:9031/logins/v1/quantidade";

    var response =
          await http.get(_endpoint, headers: {"Accept": "application/json"});

    print(response.body);

    var bodyReturned = json.decode(response.body);

    double quantidadeSucesso = bodyReturned['quantidadeSucesso'];
    double quantidadeNegado = bodyReturned['quantidadeNegado'];
    double quantidadeFalha = bodyReturned['quantidadeFalha'];

    print("quantidadeSucesso" + quantidadeSucesso.toString());
    print("quantidadeNegado" + quantidadeNegado.toString());
    print("quantidadeFalha" + quantidadeFalha.toString());

    return Future.value({"Sucesso": quantidadeSucesso,
                         "Negado": quantidadeNegado,
                         "Falha": quantidadeFalha});

  }
}