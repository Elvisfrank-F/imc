import 'package:imc/models/pessoa_model.dart';

import '../core/result.dart';
import '../repositories/pessoa_repository.dart';

class CalcularImcCommand{

final PessoaRepository repository;

CalcularImcCommand(this.repository);

Result<PessoaModel> calcularImc({required String? massa, required String? altura}){

double imc = 0;

if(massa == null || altura == null){
  return Result.failure("Os valores dos campos são nulos");
}

double? massaParse = double.tryParse(massa);
double? alturaParse = double.tryParse(altura);

if(massaParse == null || alturaParse == null){
  return Result.failure("Valores não numéricos");
}

if(massaParse <= 0 || alturaParse <= 0){
  return Result.failure("Valores inválidos");
}

final pessoa = repository.criarPessoa(massa: massaParse, altura: alturaParse);

pessoa.imc = pessoa.massa / (pessoa.altura * pessoa.altura);


return Result.success(pessoa);

}

}