import 'package:imc/models/pessoa_model.dart';
import 'package:imc/repositories/pessoa_repository.dart';

class PessoaRepositoryImpl implements PessoaRepository{

  @override
  PessoaModel criarPessoa({required double massa, required double alturaCm}) {
    // TODO: implement criarPessoa

    return PessoaModel()
      ..altura = alturaCm / 100
      ..massa = massa;
  }

}