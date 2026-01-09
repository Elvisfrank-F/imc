import '../models/pessoa_model.dart';

abstract class PessoaRepository {
  PessoaModel criarPessoa({required double massa, required double altura});
}