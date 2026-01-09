import 'package:imc/repositories/pessoa_repository.dart';

import '../models/pessoa_model.dart';

class PessoaRepositoryImpl implements PessoaRepository{

  @override
   PessoaModel criarPessoa({required double massa, required double altura}){
   return PessoaModel()..massa = massa .. altura = altura/100;
   }

}