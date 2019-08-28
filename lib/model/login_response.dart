
class LoginResponse{

  double quantidadeFalha;
  double quantidadeSucesso;
  double quantidadeNegado;

  LoginResponse(this.quantidadeFalha, this.quantidadeSucesso,
      this.quantidadeNegado);

  LoginResponse.fromJson(Map<String, dynamic> json)
        : quantidadeFalha = json['quantidadeFalha'],
          quantidadeSucesso = json['quantidadeSucesso'],
          quantidadeNegado = json ['quantidadeNegado'];

}


