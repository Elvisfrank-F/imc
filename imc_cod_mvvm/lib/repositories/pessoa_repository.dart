import '../models/pessoa_model.dart';

abstract class PessoaRepository{
  PessoaModel criarPessoa({required double peso, required double alturaCm});
}