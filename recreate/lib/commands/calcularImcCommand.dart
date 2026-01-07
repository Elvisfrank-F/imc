import 'package:imc/core/Result.dart';
import 'package:imc/models/pessoa_model.dart';
import 'package:imc/repositories/pessoa_repository.dart';

class CalcularImcCommand {

  final PessoaRepository repository;

  CalcularImcCommand(this.repository);

  Result<double> execute({required String? altura, required String? massa}){

    if(altura == null || massa == null) {
      return Result.failure("Campos nullos");
    }

    final massaParse = double.tryParse(massa);
    final alturaParse = double.tryParse(altura);

    if(massaParse == null || alturaParse == null) {
      return Result.failure("Os valores digitados não são numéricos");
    }

    if(massaParse <= 0 || alturaParse <=0 ) {
      return Result.failure("Valores inválidos");
    }

    final PessoaModel pessoa = repository.criarPessoa(
      massa: massaParse,
      alturaCm: alturaParse
    );

    final double imc = pessoa.massa / (pessoa.altura * pessoa.altura);

    return Result.success(imc);

  }

}