import '../models/pessoa_model.dart';
import 'pessoa_repository.dart';

class PessoaRepositoryImpl implements PessoaRepository{


  @override
  PessoaModel criarPessoa({required double peso, required double alturaCm}) {
    // TODO: implement criarPessoa

    return PessoaModel()
        ..massa = peso
        ..altura = alturaCm / 100;

  }

}